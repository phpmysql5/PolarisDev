public class CricketScoreWrapper {

public  class xmlData{
   @AuraEnabled
  public String matchScore{get;set;}@AuraEnabled
   public String matchId{get;set;}@AuraEnabled
   public String matchLink{get;set;}
   @AuraEnabled
   public String matchData{get;set;}
   
   
}
public class Innings_list {
        public String current;
        public String description;
        public String innings_number;
        public Integer selected;
        public String team_id;
    }

public class Common {
        public List<Batting> batting;
        public List<Bowling> bowling;
        public Innings innings;
        public List<Innings_list> innings_list;
        public String innings_number;
        public Match match;
    }

public class Squad {
        public String alpha_name;
        public String captain;
        public String card_long;
        public String card_qualifier;
        public String card_short;
        public String date_announced;
        public String dob;
        public String event_content_type;
        public String event_object_id;
        public String keeper;
        public String known_as;
        public String mobile_name;
        public String object_id;
        public String player_id;
        public String popular_alt_id;
        public String popular_name;
        public String popular_object_id;
        public String portrait_alt_id;
        public String portrait_object_id;
        public String role_id;
        public String role_name;
        public String role_priority;
        public String role_type_id;
        public String role_type_name;
        public String squad_id;
        public String squad_note;
        public String squad_title;
        public String squad_type_id;
        public String squad_type_name;
    }
    
    public class Innings{
        public String ball_limit;
        public String balls;
        public String batted;
        public String batting_team_id;
        public String bowling_team_id;
        public String bpo;
        public String byes;
        public String event;
        public String event_name;
        public String extras;
        public String innings_number;
        public String innings_numth;
        public String lead;
        public String legbyes;
        public String live_current;
        public String live_current_name;
        public String minutes;
        public String noballs;
        public String old_penalty_or_bonus;
        public String over_limit;
        public String over_limit_run_rate;
        public String over_split_limit;
        public String overs;
        public String overs_docked;
        public String penalties;
        public String penalties_field_end;
        public String penalties_field_start;
        public String run_rate;
        public String runs;
        public String target;
        public String wickets;
        public String wides;
    }

    public class Other_scores { 
        public List<Domestic> domestic;
        public List<Centre> international;
        public List<Others> others;
    }

    public class Substitute { 
        public String age_days;
        public String age_years;
        public String alpha_name;
        public String batting_hand;
        public String batting_style;
        public String batting_style_long;
        public String bowling_hand;
        public String bowling_pacespin;
        public String bowling_style;
        public String bowling_style_long;
        public String captain;
        public String card_long;
        public String card_qualifier;
        public String card_short;
        public String dob;
        public String full_sub;
        public String full_sub_innings;
        public String full_sub_name;
        public String full_sub_overs;
        public String full_sub_player_id;
        public String keeper;
        public String known_as;
        public String mobile_name;
        public String String_id;
        public String player_id;
        public String player_primary_role;
        public String player_style_id;
        public String player_type;
        public String player_type_name;
        public String popular_name;
        public String portrait_alt_id;
        public String portrait_String_id;
        public String team_abbreviation;
        public String team_id;
        public String team_name;
        public String team_short_name;
    }

    public class Bowling_scoring { 
        public String dots;
        public String fours;
        public String player_id;
        public String sixes;
    }

    public class Innings_Z { 
        public String ball_limit;
        public String balls;
        public String batted;
        public String batting_team_id;
        public String bowling_team_id;
        public String bpo;
        public String event;
        public String event_name;
        public String innings_number;
        public String lead;
        public String live_current;
        public String live_current_name;
        public String over_limit;
        public String over_limit_run_rate;
        public String over_split_limit;
        public String overs;
        public String remaining_balls;
        public String remaining_overs;
        public String remaining_wickets;
        public String required_run_rate;
        public String run_rate;
        public String runs;
        public String target;
        public String team_id;
        public String wickets;
    }

    public class Others { 
        public String String_id;
        public String start_time;
        public String team1_desc;
        public String team1_name;
        public String team2_desc;
        public String team2_name;
        public String url;
    }

    public class Player1 { 
        public String fow_runs;
        public String partnership_runs;
        public String player_id;
    }

    public class Batsman { 
        public String balls_faced;
        public String fours;
        public String live_current_name;
        public String player_id;
        public String runs;
        public String sixes;
    }

    public class Domestic { 
        public String String_id;
        public String result;
        public String start_time;
        public String team1_desc;
        public String team1_name;
        public String team2_desc;
        public String team2_name;
        public String url;
    }

    public class Batting { 
        public String balls_faced;
        public Centre batting_averages;
        public Centre batting_averages_series;
        public String batting_position;
        public Batting_pvp batting_pvp;
        public Batting_recent batting_recent;
        public String fours;
        public String innings_number;
        public String live_current;
        public String live_current_name;
        public String minutes;
        public String player_id;
        public String runs;
        public String sixes;
        public String strike_rate;
        public String team_id;
       // public String balls_faced;
        public String batting_style;
        public String control_percentage;
        public String dismissal_name;
        public String dot_ball_percentage;
        public String known_as;
      //  public String live_current_name;
        public Integer match_award;
        public String notout;
       // public String player_id;
        public String popular_name;
        public Preferred_shot preferred_shot;
      //  public String runs;
        public List<String> runs_summary;
        public String scoring_shots;
      //  public String strike_rate;
        public List<Wagon_zone> wagon_zone;
        public String hand;
        public String image_path;
        public String position;
    }

public class Wagon_zone {
        public Integer runs;
        public List<Integer> runs_summary;
        public Integer scoring_shots;
    }

 public class Preferred_shot {
        public String balls_faced;
        public String runs;
        public List<String> runs_summary;
        public String shot_name;
    }


    public class Out_player { 
        public String balls_faced;
        public String dismissal_string;
        public String fours;
        public String minutes;
        public String player_id;
        public String runs;
        public String sixes;
        public String strike_rate;
    }

    public class Comms { 
        public List<Ball> ball;
        public List<Batsman> batsman;
        public List<Bowler> bowler;
        public String event_string;
        public String innings_number;
        public String over_complete;
        public String over_number;
        public String required_string;
        public String runs;
        public String team_id;
        public String wickets;
    }

    public class Centre {
    public Common common;
    }

    public class Batting_recent { 
        public String balls;
        public String over_span;
        public String player_id;
        public String runs;
    }

    public class Teams { 
        public String host_team;
        public String String_id;
        public String primary_team;
        public String series_id;
        public String series_result_name;
        public String site_id;
        public String team_abbreviation;
        public String team_filename;
        public String team_id;
        public String team_name;
        public String team_short_name;
        public String url_component;
    }

    public class Innings_recent { 
        public String balls;
        public String innings_number;
        public String over_span;
        public String run_rate;
        public String runs;
        public String wickets;
    }

    public class Forecast { 
        public String dateX;
        public String high_temperature_c;
        public String low_temperature_c;
        public String sky_name_day;
        public String sky_name_night;
    }

    public class Fow { 
        public String fow_order;
        public String fow_overs;
        public String fow_runs;
        public String fow_wickets;
        public String innings_number;
        public String live_current;
        public String live_current_name;
        public String opposition_id;
        public Centre out_player;
        public String partnership_overs;
        public String partnership_rate;
        public String partnership_runs;
        public String partnership_wicket;
        public String partnership_wicket_name;
        public List<Player> player;
        public String player_id;
        public String team_id;
    }

    public class Official { 
        public String age_days;
        public String age_years;
        public String alpha_name;
        public String batting_hand;
        public String bowling_hand;
        public String bowling_pacespin;
        public String card_long;
        public String card_qualifier;
        public String card_short;
        public String dob;
        public String known_as;
        public String mobile_name;
        public String String_id;
        public String player_id;
        public String player_type;
        public String player_type_name;
        public String popular_name;
        public String portrait_alt_id;
        public String portrait_String_id;
        public String team_abbreviation;
        public String team_id;
        public String team_name;
        public String team_short_name;
    }

    public class Batting_pvp { 
        public String balls;
        public String bowler_player_id;
        public String runs;
    }

    public class Ball { 
        public String comms_id;
        public String dismissal;
        public String event;
        public String innings_number;
        public String over_number;
        public String overs_actual;
        public String overs_unique;
        public String players;
        public String speed_kph;
        public String speed_mph;
        public String text;
    }

    public class Weather { 
        public List<Forecast> forecast;
        public Observation observation;
    }

    public class Bowling { 
        public Centre bowling_averages;
        public Centre bowling_averages_series;
        public Bowling_scoring bowling_scoring;
        public Centre bowling_spell;
        public String conceded;
        public String economy_rate;
        public String innings_number;
        public String live_current;
        public String live_current_name;
        public String maidens;
        public String noballs;
        public String overs;
        public String player_id;
        public String team_id;
        public String wickets;
        public String wides;
      //  public String conceded;
        public String hand;
        public String image_path;
        public String known_as;
      //  public String live_current_name;
      //  public String maidens;
      //  public String overs;
        public String pacespin;
      //  public String player_id;
        public String popular_name;
        public String position;
       // public String wickets;
    }

    public class Player { 
        public String age_days;
        public String age_years;
        public String alpha_name;
        public String batting_hand;
        public String batting_style;
        public String batting_style_long;
        public String bowling_hand;
        public String bowling_pacespin;
        public String bowling_style;
        public String bowling_style_long;
        public String captain;
        public String card_long;
        public String card_qualifier;
        public String card_short;
        public String dob;
        public String keeper;
        public String known_as;
        public String mobile_name;
        public String String_id;
        public String player_id;
        public String player_primary_role;
        public String player_style_id;
        public String player_type;
        public String player_type_name;
        public String popular_name;
        public String portrait_alt_id;
        public String portrait_String_id;
    }

    public class Bowler { 
        public String conceded;
        public String live_current_name;
        public String maidens;
        public String overs;
        public String player_id;
        public String wickets;
    }

    public class Match { 
        public String actual_days;
        public String adjusted;
        public String amount;
        public String amount_balls;
        public String amount_name;
        public String amount_type;
        public String away_team_id;
        public String ballbyball_source;
        public String batting_first_team_id;
        public String bitly_hash;
        public String cancelled_match;
        public String cms_match_title;
        public String commentary_source;
        public String continent_id;
        public String continent_name;
        public String country_abbreviation;
        public String country_filename;
        public String country_id;
        public String country_name;
        public String current_summary;
        public String current_summary_abbreviation;
        public String dateX;
        public String date_string;
        public String days_extended;
        public String end_date;
        public String end_date_raw;
        public String floodlit;
        public String floodlit_name;
        public String followon;
        public String general_class_card;
        public String general_class_id;
        public String general_class_name;
        public String general_number;
        public String general_valid;
        public String gmt_difference;
        public String ground_id;
        public String ground_latitude;
        public String ground_longitude;
        public String ground_name;
        public String ground_String_id;
        public String ground_small_name;
        public String hawkeye_source;
        public String head2head_source;
        public String home_team_id;
        public String hours_string;
        public String international_class_card;
        public String international_class_id;
        public String international_class_name;
        public String international_number;
        public String international_valid;
        public String legacy_url;
        public String live_commentator;
        public String live_companion;
        public String live_day_number;
        public String live_innings_number;
        public String live_match;
        public String live_note;
        public String live_overs_remaining;
        public String live_overs_unique;
        public String live_scorer;
        public String live_session_number;
        public String live_state;
        public String match_clock;
        public String match_day_countdown;
        public String match_minute_countdown;
        public String match_path;
        public String match_status;
        public String neutral_match;
        public String player_rating;
        public String present_date_gmt;
        public String present_date_local;
        public String present_datetime_gmt;
        public String present_datetime_local;
        public String present_time_gmt;
        public String present_time_local;
        public String rain_rule;
        public String rain_rule_name;
        public String rating_promo;
        public String reduced;
        public String reserve_days_used;
        public String result;
        public String result_name;
        public String result_short_name;
        public String schedule_note;
        public String scheduled_days;
        public String scheduled_innings;
        public String scheduled_overs;
        public String scorecard_source;
        public String scribble_id;
        public String season;
        public String site_id;
        public String site_name;
        public String start_date;
        public String start_date_gmt_offset;
        public String start_date_raw;
        public String start_datetime_gmt;
        public String start_datetime_local;
        public String start_time_gmt;
        public String start_time_local;
        public String team1_abbreviation;
        public String team1_class_id;
        public String team1_country_id;
        public String team1_filename;
        public String team1_id;
        public String team1_logo_alt_id;
        public String team1_logo_String_id;
        public String team1_name;
        public String team1_String_id;
        public String team1_short_name;
        public String team2_abbreviation;
        public String team2_class_id;
        public String team2_country_id;
        public String team2_filename;
        public String team2_id;
        public String team2_logo_alt_id;
        public String team2_logo_String_id;
        public String team2_name;
        public String team2_String_id;
        public String team2_short_name;
        public String tiebreaker_name;
        public String tiebreaker_team_id;
        public String tiebreaker_type;
        public String time_zone;
        public String toss_decision;
        public String toss_decision_name;
        public String toss_winner_team_id;
        public String town_aka;
        public String town_area;
        public String town_id;
        public String town_name;
        public String tz_short_name;
        public String url_component;
        public String watch_espn_id;
        public String weather_location_code;
        public String winner_team_id;
    }

    public class Observation { 
        public String dateX;
        public String description;
        public String temperature_c;
        public String timeX;
    }

    public class Team { 
        public String batsmen_in_side;
        public String content_id;
        public String country_id;
        public String fielders_in_side;
        public String logo_alt_id;
        public String logo_image_height;
        public String logo_image_path;
        public String logo_image_width;
        public String logo_String_id;
        public String String_id;
        public List<Player> player;
        public String players_in_side;
        public String site_id;
        public String team_abbreviation;
        public String team_filename;
        public String team_general_name;
        public String team_id;
        public String team_name;
        public String team_short_name;
        public String url_component;
        public List<Squad> squad;
    }

    public class Recent_overs { 
        public String ball;
        public String ball_number;
        public String extras;
        public String over_number;
    }

    public class Live { 
        public List<Batting> batting;
        public List<Bowling> bowling;
        public String breakX;
        public List<Centre> field_restrict;
        public List<Fow> fow;
        public Innings_Z innings;
        public List<Innings_recent> innings_recent;
        public List<List<Recent_overs>> recent_overs;
        public List<Centre> review;
        public String status;
    }
      
    public Centre centre;
    public List<Comms> comms;
    public String description;
    public List<Innings> innings;
    public Live live;
    public Centre live_clipper;
    public Centre live_video;
    public Match match;
    public String match_card;
    public String middle_column;
    public List<Official> official;
    public Other_scores other_scores;
    public String score_source;
    public List<Series> series;
    public List<Substitute> substitute;
    public List<Team> team;
    public List<Centre> tiebreaker;
    public Weather weather;

    public class Series { 
        public String class_id;
        public String class_name;
        public String content_id;
        public String dateX;
        public String end_date;
        public String end_date_raw;
        public String final_type_name;
        public String group_title;
        public String major_trophy;
        public String match_number;
        public String match_title;
        public String match_type_name;
        public String number_of_hosts;
        public String number_of_matches;
        public String number_of_teams;
        public String String_id;
        public String points;
        public String replayed_date;
        public String schedule_note;
        public String score_module_position;
        public String season;
        public String series_abbreviation;
        public String series_category_id;
        public String series_category_name;
        public String series_filename;
        public String series_lead_abandoned;
        public String series_lead_cancelled;
        public String series_lead_how_won_name;
        public String series_lead_lost;
        public String series_lead_result_name;
        public String series_lead_team_name;
        public String series_lead_total;
        public String series_lead_type_name;
        public String series_lead_won;
        public String series_long_description;
        public String series_name;
        public String series_status;
        public String series_type_id;
        public String series_type_name;
        public String site_id;
        public String start_date;
        public String start_date_raw;
        public String team1_points;
        public String team2_points;
        public List<Teams> teams;
        public String tiebreaker_id;
        public String tiebreaker_name;
        public String trophy_abbreviation;
        public String trophy_class_id;
        public String trophy_country_id;
        public String trophy_id;
        public String trophy_name;
        public String trophy_short_name;
        public String url_component;
    }


}