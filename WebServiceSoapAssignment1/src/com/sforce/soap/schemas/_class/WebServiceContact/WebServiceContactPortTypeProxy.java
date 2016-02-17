package com.sforce.soap.schemas._class.WebServiceContact;

public class WebServiceContactPortTypeProxy implements com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactPortType {
  private String _endpoint = null;
  private com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactPortType webServiceContactPortType = null;
  
  public WebServiceContactPortTypeProxy() {
    _initWebServiceContactPortTypeProxy();
  }
  
  public WebServiceContactPortTypeProxy(String endpoint) {
    _endpoint = endpoint;
    _initWebServiceContactPortTypeProxy();
  }
  
  private void _initWebServiceContactPortTypeProxy() {
    try {
      webServiceContactPortType = (new com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactServiceLocator()).getWebServiceContact();
      if (webServiceContactPortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)webServiceContactPortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)webServiceContactPortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (webServiceContactPortType != null)
      ((javax.xml.rpc.Stub)webServiceContactPortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.sforce.soap.schemas._class.WebServiceContact.WebServiceContactPortType getWebServiceContactPortType() {
    if (webServiceContactPortType == null)
      _initWebServiceContactPortTypeProxy();
    return webServiceContactPortType;
  }
  
  public java.lang.String createNewStudent(java.lang.String name, java.lang.String classId, java.lang.String sex, java.util.Date dob) throws java.rmi.RemoteException{
    if (webServiceContactPortType == null)
      _initWebServiceContactPortTypeProxy();
    return webServiceContactPortType.createNewStudent(name, classId, sex, dob);
  }
  
  public java.lang.String queryForContact(java.lang.String query) throws java.rmi.RemoteException{
    if (webServiceContactPortType == null)
      _initWebServiceContactPortTypeProxy();
    return webServiceContactPortType.queryForContact(query);
  }
  
  
}