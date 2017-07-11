/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
        
        /*    1    */
        //Get button
        var say = document.getElementById('say');
        
        //Button click method
        say.onclick = function() {
            
            //JS -> OC
            //cordova.exec(js success callback, js failure callback, oc plugin class, oc method name, oc callback value);
            //p.s.  oc callback value must be types of [].
            cordova.exec(js_success_callback,
                         js_failure_callback,
                         'HelloPlugin',
                         'sayHello',
                         ['Hello, Cordova!', 'Hello, I am JS!']);
        }
        
        //ObjC: CDVCommandStatus_OK
        var js_success_callback = function(value) {
            
            //If need Xcode run js(console.log()) in Cordova, use:
            //Terminal: $sudo cordova plugin add cordoba-plugin-console
            console.log(value);
        };
        
        //ObjC: CDVCommandStatus_ERROR
        var js_failure_callback = function(value) {
            console.log(value);
        };
        
        
        /*    2    */
        var open = document.getElementById('open');
        open.onclick = function() {
            //JS -> OC
            cordova.exec(function () {},
                         function () {},
                         'HelloPlugin',
                         'openNew',
                         []);
        }
    },
    
    //OC -> JS
    dismissViewController: function(value) {
        console.log(value);
    }
};

app.initialize();
