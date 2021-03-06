package com.bananas.xml {
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;

    import mx.logging.ILogger;
    import mx.logging.Log;
    import mx.utils.ObjectUtil;

    public class ClassGenerator
    {
        include "../../../build/schema.as";

        private static var log:ILogger = Log.getLogger("com.bananas.xml.ClassGenerator");

        private static var reserved:Object = {"class":"class_r"};

        private var ns:Namespace;
        private var packageString:String;
        private var path:String = "file:///C:/work/google.code/fcsh.air/src/com/bananas/generated/";

        public function ClassGenerator()
        {
            packageString = "com.bananas.generated";

            ns = flex_config_xsd_xml.namespace("xs");
            log.debug("Namespace \n" + ObjectUtil.toString(ns));
        }

        public function generate():void
        {
            var schema:XMLList = flex_config_xsd_xml.ns::element;
            for each(var item:XML in schema)
            {
                if (isComplexType(item))
                {
                    createClass(item);
                }
                else
                {
                    log.debug("Class " + item.@name + " is SimpleType " + item.@type);
                }
            }
        }

        private function createClass(xml:XML, level:int = 0):void
        {
            var name:String = String(xml.@name);
            var space:String = getSpace(level);
            log.debug(space + "Create Class: " + packageString + "." + name);

            var file:File = new File();
            file.url = path + getClassName(name) + ".as";
            var fileStream:FileStream = new FileStream();
            fileStream.open(file, FileMode.WRITE);

            fileStream.writeMultiByte("package " + packageString + " {\n", "utf-8");
            fileStream.writeMultiByte("\n", "utf-8");

			fileStream.writeMultiByte("   [Bindable]\n", "utf-8");
            fileStream.writeMultiByte("   public class " + getClassName(name) + "\n", "utf-8");
            fileStream.writeMultiByte("   {\n", "utf-8");

            var item:XML;

            for each(item in xml.ns::complexType.ns::attribute)
            {
                log.debug(space + "    Class " + name + " has attribute " + item.@name);
                fileStream.writeMultiByte("       [Node (name=\"" + item.@name + "\", object=\"" + getAStype(item.@type) + "\", array=\"" + false + "\")]\n", "utf-8");
                fileStream.writeMultiByte("       public var " + getName(String(item.@name)) + ":" + getAStype(item.@type) + ";\n", "utf-8");
            }

            var choice:XMLList = xml.ns::complexType.ns::choice;
            var seq:Boolean = false;
            if (choice.length() == 0)
            {
                choice = xml.ns::complexType.ns::sequence;
                seq = xml.ns::complexType.ns::sequence.@maxOccurs == "unbounded";
            }
            else
            {
                seq = false;
            }

            log.info(space + " is Array " + seq);

            for each(item in choice.ns::element)
            {
                seq = (String(item.@maxOccurs) == "unbounded");
                if (isComplexType(item))
                {
                    log.debug(space + "    Class " + name + " has complex property " + item.@name);
                    fileStream.writeMultiByte("       [Node (name=\"" + item.@name + "\", object=\"" + packageString + "." + getClassName(String(item.@name)) + "\", array=\"" + seq + "\")]\n", "utf-8");
                    if (seq)
                    {
                        fileStream.writeMultiByte("       public var " + getName(String(item.@name)) + ":Array;\n", "utf-8");
                    }
                    else
                    {
                        fileStream.writeMultiByte("       public var " + getName(String(item.@name)) + ":" + getClassName(String(item.@name)) + ";\n", "utf-8");
                    }
                    createClass(item, level + 1);
                }
                else
                {
                    log.debug(space + "    Class " + name + " has simple property " + item.@name + " of type " + item.@type);
                    fileStream.writeMultiByte("       [Node (name=\"" + item.@name + "\", object=\"" + getAStype(item.@type) + "\", array=\"" + seq + "\")]\n", "utf-8");
                    if (item.@maxOccurs == "unbounded")
                    {
                        fileStream.writeMultiByte("       public var " + getName(String(item.@name)) + ":Array;\n", "utf-8");
                    }
                    else
                    {
                        fileStream.writeMultiByte("       public var " + getName(String(item.@name)) + ":" + getAStype(item.@type) + ";\n", "utf-8");
                    }
                }
            }

            if (choice.length() == 0)
            {
                log.warn("convert failed:" + name);
            }

            fileStream.writeMultiByte("   }\n", "utf-8");
            fileStream.writeMultiByte("}\n", "utf-8");
            fileStream.close();
        }

        private function getClassName(name:String):String
        {
            return getName(name).replace(/^([a-z])/g, repl);
        }

        private function getName(name:String):String
        {
            var propertyName:String = name.replace(/-([a-z])/g, repl);
            if (reserved.hasOwnProperty(propertyName))
            {
                return reserved[propertyName];
            }
            return propertyName;
        }

        private function repl():String
        {
            return (arguments[1] as String).toUpperCase();
        }

        private function getAStype(xsType:String):String
        {
            switch (xsType)
                    {
                case "xs:boolean":
                    return "Boolean";
                case "xs:integer":
                    return "int";
                case "xs:decimal":
                    return "Number";
                case "xs:date":
                    return "Date";
                case "xs:string":
                    return "String";
                case "xs:unsignedInt":
                    return "uint";
            }
            throw new Error("Unknown type " + xsType);
        }

        private function isComplexType(xml:XML):Boolean
        {
            return (XMLList(xml.@type).length() == 0);
        }

        private function getSpace(level:int):String
        {
            var result:String = "";
            for (var i:int = 0; i < level; i++)
            {
                result += "    ";
            }
            return result;
        }

    }
}