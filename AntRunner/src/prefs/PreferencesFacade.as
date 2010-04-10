package prefs {

    public class PreferencesFacade extends Preference
    {
        private static var _instance:PreferencesFacade;

        public static function get instance():PreferencesFacade
        {
            if (!_instance)
            {
                _instance = new PreferencesFacade();
            }
            return _instance;
        }

        public function PreferencesFacade()
        {
            super("preferences.amf");
        }
    }
}