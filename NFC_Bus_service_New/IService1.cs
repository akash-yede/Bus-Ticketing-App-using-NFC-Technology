using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Xml;
using System.Xml.Linq;

namespace NFCService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        //, BodyStyle = WebMessageBodyStyle.Bare, RequestFormat = WebMessageFormat.Xml, ResponseFormat = WebMessageFormat.Json
        [OperationContract]
        [WebGet(UriTemplate = "Login/{user}/{pass}")]
        XElement Login(string user, string pass);

        [OperationContract]
        [WebGet(UriTemplate = "FetchBalance/{passengerId}")]
        XElement fetch_balance(string passengerId);

        [OperationContract]
        [WebGet(UriTemplate = "Travel/{check}")]
        XElement travel(string check);

        [OperationContract]
        [WebGet(UriTemplate = "Transaction/{passengerId}/{sFrom}/{dTo}/{amt}/{qty}")]
        XElement transaction(string passengerId, string sFrom, string dTo, string amt, string qty);

        [OperationContract]
        [WebGet(UriTemplate = "FareCheck/{source}/{Destination}")]
        XElement fare_check(string source, string destination);

        [OperationContract]
        [WebGet(UriTemplate = "PassengerLog/{passengerId}")]
        XElement passenger_log(string passengerId);

    }
}
