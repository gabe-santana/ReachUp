using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Beacon : clsMySqlConnection
    {
        #region Properties
        public int Type { get; set; }
        public string UUID { get; set; }
        public Local LocalBeacon { get; set; }
        public Box BoxBeacon {get; set; }

        [JsonIgnore] public string TypeName {get; set; }
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor

        /// <summary>
        /// Null constructor
        /// </summary>
        public Beacon() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="uuid"></param>
        /// <param name="type"></param>
        /// <param name="local"></param>
        public Beacon(string uuid, int type, Local local) : base()
        {
            this.UUID = uuid;
            this.Type = type;
            this.LocalBeacon = local;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="uuid"></param>
        /// <param name="type"></param>
        /// <param name="box"></param>
        /// <returns></returns>
        public Beacon(string uuid, int type, Box box) : base()
        {
            this.UUID = uuid;
            this.Type = type;
            this.BoxBeacon = box;
        }

        /// <summary>
        /// Get Local by Beacon
        /// </summary>
        /// <param name="uuid"></param>
        /// <param name="typeName"></param>
        public Beacon(string uuid, string typeName)
        {
            this.UUID = uuid;
            this.TypeName = typeName;
        }

        /// <summary>
        /// Constructor used in the Box class, on GetByLocal method
        /// </summary>
        /// <param name="uuid"></param>
        /// <param name="type"></param>
        public Beacon(string uuid, int type)
        {
            this.UUID = uuid;
            this.Type = type;
        }
        #endregion

        #region Methods

        /// <summary>
        /// Gets a beacon from its uuid
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns>Beacon object</returns>
        public async Task<Beacon> Get(string uuid) 
        {
            if (base.DQLCommand(Procedure.pegarBeacon, ref this.Data,
                    new string[,] {
                {"pUUID", uuid}
                }))
            {
                if (this.Data.HasRows)
                {
                    Beacon beacon = null;

                    while (this.Data.Read())
                    {
                        beacon = new Beacon(uuid,
                            int.Parse(this.Data["cd_tipo_beacon"].ToString()),
                            await new Local().Get(
                                int.Parse(this.Data["cd_local"].ToString())
                            )
                            
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return beacon;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Picks up beacons of a type
        /// </summary>
        /// <param name="type"></param>
        /// <returns>Beacon object list</returns>
        public async Task<List<Beacon>> GetAll(int type)
        {
            if (base.DQLCommand(Procedure.pegarBeaconsTipo, ref this.Data,
                 new string[,] {
                 {"pTipo", type.ToString()}
             }))
            {
                if (this.Data.HasRows)
                {
                    List<Beacon> beacons = new List<Beacon>();

                    while (this.Data.Read())
                    {
                        beacons.Add(
                            new Beacon(
                            this.Data["cd_uuid_beacon"].ToString(),
                            type,
                            await new Local().Get(
                                int.Parse(this.Data["cd_local"].ToString())
                                )
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return beacons;
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        /// <summary>
        /// Picks up the identification beacons of a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Beacon object list</returns>
        /// <remarks>In a larger and more faithful to reality project scope, a location could have several beacons,
        /// not just one. The system already supports this possibility, even though it is not portrayed</remarks>
        public async Task<List<Beacon>> ByLocal(int local)
        {
             if (base.DQLCommand(Procedure.pegarBeaconsDeLocal, ref this.Data,
                 new string[,] {
                 {"pLocal", local.ToString()}
             }))
             {
                if (this.Data.HasRows)
                {
                    List<Beacon> beacons = new List<Beacon>();

                    while (this.Data.Read())
                    {
                        beacons.Add(
                            new Beacon(
                            this.Data["cd_uuid_beacon"].ToString(),
                            int.Parse(this.Data["cd_tipo_beacon"].ToString()),
                            await new Local().Get(
                                local
                                )
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return beacons;
                }
                base.Disconnect();
                return null;
             }
             return null;
        }

        /// <summary>
        /// Adds a beacon
        /// </summary>
        /// <returns>Bool</returns>
        /// <remarks>The box id should be non-null</remarks>
        public Task<bool> Add() 
        {
            if (base.DMLCommand(Procedure.cadastrarBeacon,
                new string[,] {
                    {"pUUID" , this.UUID}, {"pTipo", this.Type.ToString()},
                    {"pBox", this.BoxBeacon.Id.ToString()}
                 }
                ))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Deletes a beacon
        /// </summary>
        /// <param name="uuid"></param>
        /// <returns>Bool</returns>
        public Task<bool> Delete(string uuid) 
        {
            if (base.DMLCommand(Procedure.deletarBeacon, new string[,]{
                   {"pUUID", uuid}
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        #endregion

    }
}
