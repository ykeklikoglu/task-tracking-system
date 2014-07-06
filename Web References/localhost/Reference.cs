﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.269
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

// 
// This source code was auto-generated by Microsoft.VSDesigner, Version 4.0.30319.269.
// 
#pragma warning disable 1591

namespace Görev_Takip_sistemim.localhost {
    using System;
    using System.Web.Services;
    using System.Diagnostics;
    using System.Web.Services.Protocols;
    using System.ComponentModel;
    using System.Xml.Serialization;
    
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="CurrencySoap", Namespace="http://tempuri.org/")]
    public partial class Currency : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback TlKarsiligiOperationCompleted;
        
        private bool useDefaultCredentialsSetExplicitly;
        
        /// <remarks/>
        public Currency() {
            this.Url = global::Görev_Takip_sistemim.Properties.Settings.Default.Görev_Takip_sistemim_localhost_Currency;
            if ((this.IsLocalFileSystemWebService(this.Url) == true)) {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else {
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        public new string Url {
            get {
                return base.Url;
            }
            set {
                if ((((this.IsLocalFileSystemWebService(base.Url) == true) 
                            && (this.useDefaultCredentialsSetExplicitly == false)) 
                            && (this.IsLocalFileSystemWebService(value) == false))) {
                    base.UseDefaultCredentials = false;
                }
                base.Url = value;
            }
        }
        
        public new bool UseDefaultCredentials {
            get {
                return base.UseDefaultCredentials;
            }
            set {
                base.UseDefaultCredentials = value;
                this.useDefaultCredentialsSetExplicitly = true;
            }
        }
        
        /// <remarks/>
        public event TlKarsiligiCompletedEventHandler TlKarsiligiCompleted;
        
        /// <remarks/>
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/TlKarsiligi", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string TlKarsiligi(KurKodu kodu, Tur turu) {
            object[] results = this.Invoke("TlKarsiligi", new object[] {
                        kodu,
                        turu});
            return ((string)(results[0]));
        }
        
        /// <remarks/>
        public void TlKarsiligiAsync(KurKodu kodu, Tur turu) {
            this.TlKarsiligiAsync(kodu, turu, null);
        }
        
        /// <remarks/>
        public void TlKarsiligiAsync(KurKodu kodu, Tur turu, object userState) {
            if ((this.TlKarsiligiOperationCompleted == null)) {
                this.TlKarsiligiOperationCompleted = new System.Threading.SendOrPostCallback(this.OnTlKarsiligiOperationCompleted);
            }
            this.InvokeAsync("TlKarsiligi", new object[] {
                        kodu,
                        turu}, this.TlKarsiligiOperationCompleted, userState);
        }
        
        private void OnTlKarsiligiOperationCompleted(object arg) {
            if ((this.TlKarsiligiCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.TlKarsiligiCompleted(this, new TlKarsiligiCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// <remarks/>
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
        
        private bool IsLocalFileSystemWebService(string url) {
            if (((url == null) 
                        || (url == string.Empty))) {
                return false;
            }
            System.Uri wsUri = new System.Uri(url);
            if (((wsUri.Port >= 1024) 
                        && (string.Compare(wsUri.Host, "localHost", System.StringComparison.OrdinalIgnoreCase) == 0))) {
                return true;
            }
            return false;
        }
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public enum KurKodu {
        
        /// <remarks/>
        USD,
        
        /// <remarks/>
        CAD,
        
        /// <remarks/>
        DKK,
        
        /// <remarks/>
        SEK,
        
        /// <remarks/>
        NOK,
        
        /// <remarks/>
        CHF,
        
        /// <remarks/>
        JPY,
        
        /// <remarks/>
        SAR,
        
        /// <remarks/>
        KWD,
        
        /// <remarks/>
        AUD,
        
        /// <remarks/>
        EUR,
        
        /// <remarks/>
        GBP,
        
        /// <remarks/>
        IRR,
        
        /// <remarks/>
        SYP,
        
        /// <remarks/>
        JOG,
        
        /// <remarks/>
        BGL,
        
        /// <remarks/>
        ROL,
        
        /// <remarks/>
        ILS,
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Xml", "4.0.30319.233")]
    [System.SerializableAttribute()]
    [System.Xml.Serialization.XmlTypeAttribute(Namespace="http://tempuri.org/")]
    public enum Tur {
        
        /// <remarks/>
        ForexBuying,
        
        /// <remarks/>
        ForexSelling,
        
        /// <remarks/>
        BanknoteBuying,
        
        /// <remarks/>
        BanknoteSelling,
    }
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    public delegate void TlKarsiligiCompletedEventHandler(object sender, TlKarsiligiCompletedEventArgs e);
    
    /// <remarks/>
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Web.Services", "4.0.30319.1")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class TlKarsiligiCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal TlKarsiligiCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// <remarks/>
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
}

#pragma warning restore 1591