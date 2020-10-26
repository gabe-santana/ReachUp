using System;

namespace WebAdmin.Models
{
    public class Feedback
    {
        public int FeedbackId { get; set; }
        public ushort Type { get; set; }
        public User FeedbackUser { get; set; }
        public string Description { get; set; }
        public DateTime FeedbackDate { get; set; }
        public ushort Stars { get; set; }
    }
}