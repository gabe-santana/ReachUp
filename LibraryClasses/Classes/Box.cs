using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Box : clsDatabase
    {
        #region Properties
    
        public int Id { get; set; }
        public string Name {get; set; }
        public Local LocalBox { get; set; }
        public string BeaconUUID {get; set; } 
        public List<Beacon> Beacons {get; set; }
        #endregion

        #region Fields
        private MySqlDataReader Data = null;
        #endregion

        #region Constructors

        /// <summary>
        /// Null constructor
        /// </summary>
        public Box() : base() {}

        /// <summary>
        /// Default constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="localBox"></param>
        public Box(int id, string name, Local localBox) : base()
        {
           this.Id = id;
           this.Name = name;
           this.LocalBox = localBox;
        }

        /// <summary>
        /// Add constructor
        /// </summary>
        /// <param name="name"></param>
        /// <param name="localBox"></param>
        /// <param name="beaconUUID"></param>
        public Box(string name, Local localBox, string beaconUUID)
        {
            this.Name = name;
            this.LocalBox = localBox;
            this.BeaconUUID = beaconUUID;
        }

        /// <summary>
        /// Get by local constructor
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="beacons"></param>
        public Box(int id, string name, List<Beacon> beacons = null)
        {
            this.Id = id;
            this.Name = name;
            this.Beacons = beacons;
        }

        #endregion

        #region Public methods

        /// <summary>
        /// Registers a new shopping box
        /// </summary>
        /// <returns>Bool</returns>  
        public Task<bool> Add()
        {
            if (base.DMLCommand(Procedure.cadastrarBox, new string[,] {
               {"pNome", this.Name },
               {"pLocal", this.LocalBox.IdLocal.ToString()},
               {"pBeacon", this.BeaconUUID}

            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Updates a shopping box: name and local id
        /// </summary>
        /// <returns>Bool</returns>
        public Task<bool> Update()
        {
            if (base.DMLCommand(Procedure.atualizarBox, new string[,] {
               {"pBox", this.Id.ToString()},
               {"pNome", this.Name},
               {"pLocal", this.LocalBox.IdLocal.ToString()}
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Deletes a shopping box
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Bool</returns>
        /// <remarks>Caution: this probably shouldn't be done</remarks>
        public Task<bool> Delete(int id)
        {
            if (base.DMLCommand(Procedure.deletarBox, new string[,] {
               {"pBox", id.ToString()}
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

        /// <summary>
        /// Gets all shopping boxes owned by a local
        /// </summary>
        /// <param name="local"></param>
        /// <returns>Box object list</returns>
        public Task<List<Box>> GetByLocal(int local)
        {
            if (base.DQLCommand(Procedure.pegarBoxesLocal, ref this.Data,
            new string[,] {
              {"pLocal", local.ToString()}
            }))
            {
                if (this.Data.HasRows)
                {
                    List<Box> boxes = new List<Box>();

                    while (this.Data.Read())
                    {
                        List<Beacon> box_beacons = new List<Beacon>();
                        string[] beacons = this.Data["box_beacons"].ToString().Split(',');

                        for (int i = 0; i < beacons.Length; i++)
                        {
                            // Arrumar o retorno dos beacons: isso realmente não funciona ou é bug do VS Code?
                            int banana = beacons[i].LastIndexOf("-");

                            box_beacons.Add(
                                new Beacon(
                                    beacons[i].Substring(0, banana),
                                    beacons[i].Substring(banana + 1, 1)
                                )
                            );
                        }

                        boxes.Add(
                            new Box(
                                int.Parse(this.Data["cd_box"].ToString()),
                                this.Data["nm_box"].ToString(),
                                box_beacons
                            )
                        );
                    }
                    this.Data.Close();
                    base.Disconnect();
                    return Task.FromResult(boxes);
                }
                base.Disconnect();
                return null;
            }
            return null;
        }

        #endregion
    }
}
