using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookStore.CustomerService.Settings
{
    public class RabbitMQSettings
    {
        public string Host { get; set; }
        public QueueInfo[] ServiceQueues { get; set; }
    }

    public class QueueInfo
    {
        public string Name { get; set; }
        public int Timeout { get; set; }
    }
}
