using System;
using System.Collections.Generic;
using Xunit;
using System.Text;
using ReachUp;
using System.Threading.Tasks;

namespace BusinessLayer.Tests.UnitTests
{
    public class CommuniqueTest : Communique
    {
        public CommuniqueTest() : base() { }

        [Theory]
        [InlineData(23, true)]
        public void GotAll(int local, bool general)
        {
            Task<List<Communique>> communiques = this.GetAll(local, general);
            Assert.NotNull(communiques);
        }

        [Obsolete]
        [Theory]
        [InlineData(23, true)]
        public void NoDataFoundOrConnectionErrorOnGetAll(int local, bool general)
        {
            Task<List<Communique>> communiques = this.GetAll(local, general);
            Assert.Null(communiques);
        }

        [Theory]
        [InlineData(23, true)]
        public void GetAllException(int local, bool general)
        {
            Assert.ThrowsAsync<Exception>(() => this.GetAll(local, general));
        }

        [Theory]
        [InlineData("", 5)]
        public void Received(string email, int local)
        {
            Task<List<Communique>> communiques = this.Receive(email, local);
            Assert.NotNull(communiques);
        }

        [Obsolete]
        [Theory]
        [InlineData("", 5)]
        public void NoDataFoundOrConnectionErrorOnReceive(string email, int local)
        {
            Task<List<Communique>> communiques = this.Receive(email, local);
            Assert.Null(communiques);
        }

        [Theory]
        [InlineData("", 5)]
        public void ReceiveException(string email, int local)
        {
            Assert.ThrowsAsync<Exception>(() => this.Receive(email, local));
        }

        [Theory]
        [InlineData(7)]
        public void Got(int local)
        {
            Task<List<Communique>> communiques = this.Get(local);
            Assert.NotNull(communiques);
        }

        [Obsolete]
        [Theory]
        [InlineData(7)]
        public void NoDataFoundOrConnectionErrorOnGet(int local)
        {
            Task<List<Communique>> communiques = this.Get(local);
            Assert.Null(communiques);
        }

        [Theory]
        [InlineData(7)]
        public void GetException(int local)
        {
           Assert.ThrowsAsync<Exception>(() => this.Get(local));
        }

        [Theory]
        [InlineData(8)]
        public void GotLocalDirectedPromotions(int local)
        {
            Task<List<Communique>> communiques = this.GetLocalDirectedPromotions(local);
            Assert.NotNull(communiques);
        }

        [Obsolete]
        [Theory]
        [InlineData(8)]
        public void NoDataFoundOrConnectionErrorOnGetLocalDirectedPromotions(int local)
        {
            Task<List<Communique>> communiques = this.GetLocalDirectedPromotions(local);
            Assert.Null(communiques);
        }

        [Theory]
        [InlineData(8)]
        public void GetLocalDirectedPromotionsException(int local)
        {
            Assert.ThrowsAsync<Exception>(() => this.GetLocalDirectedPromotions(local));
        }

        [Theory]
        [InlineData(12, true)]
        public void GotLocalCommuniqueHistory(int local, bool general)
        {
            Task<List<Communique>> communiques = this.GetLocalCommuniqueHistory(local, general);
            Assert.NotNull(communiques);
        }

        [Obsolete]
        [Theory]
        [InlineData(12, true)]
        public void NoDataFoundOrConnectionErrorOnGetLocalCommuniqueHistory(int local, bool general)
        {
            Task<List<Communique>> communiques = this.GetLocalCommuniqueHistory(local, general);
            Assert.Null(communiques);
        }

        [Theory]
        [InlineData(12, true)]
        public void GetLocalCommuniqueHistoryException(int local, bool general)
        {
            Assert.ThrowsAsync<Exception>(() => this.GetLocalCommuniqueHistory(local, general));
        }

        [Theory]
        [InlineData(1, 1, "a", "", "")]
        public void Added(int localId, ushort type, string description, string startDate, string endDate)
        {
            this.LocalId = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Task<bool> added = this.Add();
            Assert.True(Convert.ToBoolean(added));
        }

        [Obsolete]
        [Theory]
        [InlineData(1, 1, "a", "", "")]
        public void NotAdded(int localId, ushort type, string description, string startDate, string endDate)
        {
            this.LocalId = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Task<bool> added = this.Add();
            Assert.False(Convert.ToBoolean(added));
        }

        [Theory]
        [InlineData(1, 1, "a", "", "")]
        public void AddException(int localId, ushort type, string description, string startDate, string endDate)
        {
            this.LocalId = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Assert.ThrowsAsync<Exception>(() => this.Add());
        }

        [Theory]
        [InlineData(1, 1, 1, "a", "", "")]
        public void Updated(int id, int localId, ushort type, string description, string startDate, string endDate)
        {
            this.CommuniqueId = id;
            this.CommuniqueLocal.IdLocal = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Task<bool> updated = this.Update();
            Assert.True(Convert.ToBoolean(updated));
        }

        [Obsolete]
        [Theory]
        [InlineData(1, 1, 1, "a", "", "")]
        public void NotUpdated(int id, int localId, ushort type, string description, string startDate, string endDate)
        {
            this.CommuniqueId = id;
            this.CommuniqueLocal.IdLocal = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Task<bool> updated = this.Update();
            Assert.False(Convert.ToBoolean(updated));

        }

        [Theory]
        [InlineData(1, 1, 1, "a", "", "")]
        public void UpdateException(int id, int localId, ushort type, string description, string startDate, string endDate)
        {
            this.CommuniqueId = id;
            this.CommuniqueLocal.IdLocal = localId;
            this.Type = type;
            this.Description = description;
            this.StartDate = startDate;
            this.EndDate = endDate;
            Assert.ThrowsAsync<Exception>(() => this.Update());
        }

        [Theory]
        [InlineData(1, 1)]
        public void Deleted(int id, int type)
        {
            Task<bool> deleted = this.Delete(id, type);
            Assert.True(Convert.ToBoolean(deleted));
        }

        [Obsolete]
        [Theory]
        [InlineData(1, 1)]
        public void NotDeleted(int id, int type)
        {
            Task<bool> deleted = this.Delete(id, type);
            Assert.False(Convert.ToBoolean(deleted));
        }

        [Theory]
        [InlineData(1, 1)]
        public void DeleteException(int id, int type)
        {
            Assert.ThrowsAsync<Exception>(() => this.Delete(id, type));
        }
    }
}
