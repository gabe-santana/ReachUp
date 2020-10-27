﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ReachUp
{
    public class Beacon : clsDatabase
    {
        #region Properties
        public int Type { get; set; }
        public string UUID { get; set; }
        public Local LocalBeacon { get; set; }
        #endregion

        #region Fields    
        private MySqlDataReader Data = null;
        #endregion

        #region Constructor
        public Beacon() : base() { }
        public Beacon(string uuid, int type) : base()
        {
            this.UUID = uuid;
            this.Type = type;
        }

        public Beacon(string uuid) : base()
        {
            this.UUID = uuid;
  
        }
        #endregion

        #region Methods
        public Task<Beacon> Get(string uuid) 
        {
            if (base.DQLCommand(Procedure.pegarBeacon, ref this.Data,
                    new string[,] {
                {"pUUID", uuid}
                }))
            {
                Beacon beacon = null;
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        beacon = new Beacon(uuid,
                            int.Parse(this.Data["cd_tipo_beacon"].ToString()));
                    }
                }
                this.Data.Close();
                base.Disconnect();
                return Task.FromResult(beacon);
            }

            return null;
        }

        public Task<List<Beacon>> GetAll(int type)
        {
            if (base.DQLCommand(Procedure.pegarBeacons, ref this.Data,
                 new string[,] {
                 {"pTipo", type.ToString()}
             }))
            {
                List<Beacon> beacons = new List<Beacon>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        beacons.Add(new Beacon(this.Data["cd_uuid_beacon"].ToString(),
                            int.Parse(type.ToString())));
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(beacons);
            }
            return null;
        }

        public Task<List<Beacon>> ByLocal(int local)
        {
             if (base.DQLCommand(Procedure.pegarBeaconsDeLocal, ref this.Data,
                 new string[,] {
                 {"pLocal", local.ToString()}
             }))
             {
                List<Beacon> beacons = new List<Beacon>();
                if (this.Data.HasRows)
                {
                    while (this.Data.Read())
                    {
                        beacons.Add(new Beacon(this.Data["cd_uuid_beacon"].ToString(),
                            int.Parse(type.ToString())));
                    }
                    this.Data.Close();
                }
                base.Disconnect();
                return Task.FromResult(beacons);
             }
             return null;
        }

        public Task<bool> Add() 
        {
            if (base.DMLCommand(Procedure.cadastrarBeacon,
                new string[,] {
                    {"pUUID" , this.UUID}, {"pTipo", this.Type.ToString()} ,
                    {"pLocal", this.LocalBeacon.IdLocal.ToString()}
                 }
                ))
            {
                return Task.FromResult(true);
            }.
            return Task.FromResult(false);
        }

        public Task<bool> Update() 
        {
            if (base.DMLCommand(Procedure.atualizarBeacon, new string[,] {
                {"pUUID", this.UUID}, {"pTipo", this.Type.ToString()},
                {"pLocal", this.LocalBeacon.IdLocal.ToString()}
            }))
            {
                return Task.FromResult(true);
            }
            return Task.FromResult(false);
        }

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
