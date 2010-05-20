package convert;

import jtv.vo.JChannel;
import jtv.vo.JProgramme;
import xmltv.generated.Channel;
import xmltv.generated.Programme;
import xmltv.generated.Tv;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class XMLTV2JTV
{
    private Tv xmltv;
    private String datePattern = "yyyyMMddHHmmss";

    public XMLTV2JTV(Tv xmltv)
    {
        this.xmltv = xmltv;
    }

    public List<JChannel> convert() throws ParseException
    {
        List<JChannel> jChannels = new ArrayList<JChannel>();

        Map<String, List<Programme>> programmeMap = createProgrammMap();
        Map<String, Channel> channelMap = createChannelMap();

        for (String key : programmeMap.keySet())
        {
            List<Programme> programmes = programmeMap.get(key);
            JChannel jChannel = new JChannel(channelMap.get(key).getDisplayName().get(0).getvalue(), new ArrayList<JProgramme>());//todo lang
            for (Programme programme : programmes)
            {
                jChannel.getProgrammes().add(new JProgramme(getTitle(programme), getDate(programme)));
            }
            jChannels.add(jChannel);
        }

        return jChannels;
    }


    // 20080715023000 -0600
    // 2008 07 15 02 30 00 -0600

    private Date getDate(Programme programme) throws ParseException
    {
        SimpleDateFormat dateFormat = new SimpleDateFormat();

        String dateString = programme.getStart().substring(0, datePattern.length());
        dateFormat.applyPattern(datePattern);

        Date date = dateFormat.parse(dateString);

        //todo time zone offset parse

        return date;
    }

    private String getTitle(Programme programme)
    {
        //todo lang
        return programme.getTitle().get(0).getvalue();
    }

    private Map<String, List<Programme>> createProgrammMap()
    {
        Map<String, List<Programme>> programmeMap = new HashMap<String, List<Programme>>();
        for (Programme proramme : xmltv.getProgramme())
        {
            List<Programme> programmes = programmeMap.get(proramme.getChannel());
            if (programmes == null)
            {
                programmes = new ArrayList<Programme>();
                programmeMap.put(proramme.getChannel(), programmes);
            }
            programmes.add(proramme);
        }
        return programmeMap;
    }

    private Map<String, Channel> createChannelMap()
    {
        Map<String, Channel> channelMap = new HashMap<String, Channel>();
        for (Channel channel : xmltv.getChannel())
        {
            channelMap.put(channel.getId(), channel);
        }
        return channelMap;
    }
}