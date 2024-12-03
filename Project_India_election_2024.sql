Create database India_election_Result_2024; 

use India_election_Result_2024;

select * from constituencywise_results;

describe constituencywise_results;
/* 1- Total seats */
Select count(distinct Parliament_Constituency) as total_seats
from constituencywise_results;


/*2-what are the total no. of seats available in each states for election.*/
Select 
s.state AS State_name,
count(distinct cr.Parliament_Constituency) as Total_seats
from Constituencywise_results as cr
INNER JOIN statewise_results as sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
INNER JOIN States as s ON sr.state_ID = s.state_ID
group by s.state;

/*3- Total seats won by NDA Alliance */
select
  SUM(case
       when Party IN (
				'Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Apna Dal (Soneylal) - ADAL',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'AJSU Party - AJSUP',
                'Asom Gana Parishad - AGP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Nationalist Congress Party - NCP',
                'Shiv Sena - SHS',
                'Sikkim Krantikari Morcha - SKM',
                'United People Party, Liberal - UPPL',
                'Rashtriya Lok Dal - RLD'
                ) then Won
                ELSE 0
                END) AS NDA_Total_Seats_Won
from partywise_results;  

/*4- Seats won by NDA ALLAINCE PARTY */
 select
 party as Party_Name, Won as Seats_Won
 from partywise_results
 where party IN (
				'Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Apna Dal (Soneylal) - ADAL',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'AJSU Party - AJSUP',
                'Asom Gana Parishad - AGP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Nationalist Congress Party - NCP',
                'Shiv Sena - SHS',
                'Sikkim Krantikari Morcha - SKM',
                'United People Party, Liberal - UPPL',
                'Rashtriya Lok Dal - RLD')
ORDER BY Seats_Won DESC;

/*5*/
select
  SUM(case
       when Party IN (
                      'Indian National Congress - INC',
                      'Aam Aadmi Party - AAAP',
                      'All India Trinamool Congress - AITC',
                      'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                      'Samajwadi Party - SP',
                      'Dravida Munnetra Kazhagam - DMK',
                      'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                      'Rashtriya Janata Dal - RJD',
                      'Jharkhand Mukti Morcha - JMM',
                      'Communist Party of India  (Marxist) - CPI(M)',
                      'Indian Union Muslim League - IUML',
                      'Jammu & Kashmir National Conference - JKN',
                      'Communist Party of India - CPI',
                      'Kerala Congress - KEC',
                      'Viduthalai Chiruthaigal Katchi - VCK',
                      'Revolutionary Socialist Party - RSP',
                      'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                      'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                      'Rashtriya Loktantrik Party - RLTP',
                      'Bharat Adivasi Party - BHRTADVSIP'
                      ) then Won
                      else 0
                      END) AS India_total_seats_won
From partywise_results;
                
/*6- Total Individual INdia Parties seat won */
 select
 party as Party_Name, Won as Seats_Won
 from partywise_results
 where party IN ('Indian National Congress - INC',
                      'Aam Aadmi Party - AAAP',
                      'All India Trinamool Congress - AITC',
                      'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                      'Samajwadi Party - SP',
                      'Dravida Munnetra Kazhagam - DMK',
                      'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                      'Rashtriya Janata Dal - RJD',
                      'Jharkhand Mukti Morcha - JMM',
                      'Communist Party of India  (Marxist) - CPI(M)',
                      'Indian Union Muslim League - IUML',
                      'Jammu & Kashmir National Conference - JKN',
                      'Communist Party of India - CPI',
                      'Kerala Congress - KEC',
                      'Viduthalai Chiruthaigal Katchi - VCK',
                      'Revolutionary Socialist Party - RSP',
                      'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                      'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                      'Rashtriya Loktantrik Party - RLTP',
                      'Bharat Adivasi Party - BHRTADVSIP')
order by Seats_Won desc;

/*7-Add new column field in table partywise_results to get the Party Allianz as
 NDA, I.N.D.I.A and OTHER */
 
 Alter Table partywise_results
 ADD column Party_Alliance varchar(50);
 
 select * from partywise_results;
 
 update partywise_results
 set Party_Alliance = 'I.N.D.I.A'
 WHERE party IN ('Indian National Congress - INC',
                      'Aam Aadmi Party - AAAP',
                      'All India Trinamool Congress - AITC',
                      'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                      'Samajwadi Party - SP',
                      'Dravida Munnetra Kazhagam - DMK',
                      'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                      'Rashtriya Janata Dal - RJD',
                      'Jharkhand Mukti Morcha - JMM',
                      'Communist Party of India  (Marxist) - CPI(M)',
                      'Indian Union Muslim League - IUML',
                      'Jammu & Kashmir National Conference - JKN',
                      'Communist Party of India - CPI',
                      'Kerala Congress - KEC',
                      'Viduthalai Chiruthaigal Katchi - VCK',
                      'Revolutionary Socialist Party - RSP',
                      'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                      'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                      'Rashtriya Loktantrik Party - RLTP',
                      'Bharat Adivasi Party - BHRTADVSIP');
                      
update partywise_results
set Party_Alliance = 'N.D.A'
WHERE party in ('Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
                'Janata Dal  (United) - JD(U)',
                'Hindustani Awam Morcha (Secular) - HAMS',
                'Apna Dal (Soneylal) - ADAL',
                'Lok Janshakti Party(Ram Vilas) - LJPRV',
                'AJSU Party - AJSUP',
                'Asom Gana Parishad - AGP',
                'Janasena Party - JnP',
                'Janata Dal  (Secular) - JD(S)',
                'Nationalist Congress Party - NCP',
                'Shiv Sena - SHS',
                'Sikkim Krantikari Morcha - SKM',
                'United People Party, Liberal - UPPL',
                'Rashtriya Lok Dal - RLD');
update partywise_results
set Party_Alliance = 'OTHERS'
where Party_Alliance is NULL;

set sql_safe_updates = 0;

/*8- Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across 
all states? */

SELECT Party_Alliance,
sum(Won) as Total_seats_Won
from Partywise_results
group by Party_Alliance
order by sum(Won) desc;

/*ONLY NDA ALLIANZ SEATS */
SELECT Party,
Won as Total_seats_Won
from Partywise_results
where Party_Alliance = 'N.D.A'
order by Won desc;

/*2nd- method - */

select p.Party_Alliance,
count(cr.Constituency_ID) as Seats_Won
from constituencywise_results as cr
inner join partywise_results as p ON cr.Party_ID = p.Party_ID
where p.Party_Alliance IN ('N.D.A', 'I.N.D.I.A', 'OTHERS')
GROUP BY p.Party_Alliance
order by Seats_Won desc;

/*9- Winning candidate's name, their party name, total votes, and the margin of victory for a
 specific state and constituency?*/

SELECT cr.Winning_Candidate, p.party, p.Party_Alliance, cr.Total_Votes, cr.Margin, s.state, 
cr.Constituency_Name from constituencywise_results as cr
inner join partywise_results p ON cr.Party_ID = p.Party_ID
inner join statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
inner join states s ON sr.State_ID = s.State_ID
where s.State = 'West Bengal' AND cr.Constituency_Name = 'KOLKATAUTTAR';


/*10- What is the distribution of EVM votes versus postal votes for candidates in a 
specific constituency?*/

select cd.candidate, cd.Party, cd.EVM_Votes, cd.Postal_Votes, 
cd.Total_Votes, cr.Constituency_Name
from constituencywise_details cd
inner join constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
where cr.Constituency_Name = 'JADAVPUR'
order by cd.Total_Votes desc;

/*11- Which parties won the most seats in s State, and how many seats did each party win? */
select pr.Party, 
count(Constituency_ID) as Seats_Won
from constituencywise_results as cr
inner join Partywise_results pr ON cr.Party_ID = pr.Party_ID
inner join statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
inner join states s ON sr.State_ID = s.State_ID
where s.State = 'Andhra Pradesh'
group by pr.Party
order by Seats_Won desc;

/*12- What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) 
in each state for the India Elections 2024*/

SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'N.D.A' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN p.party_alliance = 'OTHERS' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN 
    states s ON sr.State_ID = s.State_ID
WHERE 
    p.party_alliance IN ('N.D.A', 'I.N.D.I.A',  'OTHERS')  -- Filter for NDA and INDIA alliances
GROUP BY 
    s.State
ORDER BY 
    s.State;
    
/*13-Which candidate received the highest number of EVM votes in each constituency (Top 10)?*/

SELECT cd.Candidate, max(cd.EVM_Votes) as Max_Votes , cr.Constituency_Name, cr.constituency_ID
from constituencywise_details cd
inner join constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
GROUP BY cr.Constituency_Name, cd.Candidate, cr.constituency_ID
order by Max_Votes desc 
LIMIT 10;

/*14-Which candidate won and which candidate was the runner-up in each constituency of State for the
 2024 elections?*/
 /*WITH RankedCandidate as
 (
 select cd.Candidate, cd.constituency_ID, cr.Constituency_Name, sr.state,
 row_number() OVER (PARTITION BY cd.Constituency_ID order by 
 cd.EVM_Votes + cd.Postal_Votes) as Vote_Rank
 from constituencywise_details cd
inner join constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID*/

SELECT 
    cd.Candidate, 
    cd.Constituency_ID, 
    cr.Constituency_Name, 
    sr.State,
    cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
    ROW_NUMBER() OVER (PARTITION BY sr.State ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS State_Vote_Rank
FROM 
    constituencywise_details cd
INNER JOIN 
    constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
INNER JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
LIMIT 2;

/*15- For the state of Maharashtra, what are the total number of seats, total number of candidates, 
total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal 
votes?*/

Select s.State,
COUNT(DISTINCT cr.Constituency_ID) as Total_Seats,
COUNT(DISTINCT cd.Candidate) as Total_Candidates,
COUNT(DISTINCT pr.Party) as Total_Party,
SUM(cd.EVM_Votes + cd.Postal_Votes) as Total_Votes,
SUM(cd.EVM_Votes) as Total_EVM_Votes,
SUM(cd.Postal_Votes) as Total_Postal_Votes
from Constituencywise_details cd
inner join Constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
inner join statewise_results sr ON sr.Parliament_Constituency = cr.Parliament_Constituency
Inner join Partywise_results pr ON pr.Party_ID = cr.Party_ID
inner join States s ON sr.State_ID = s.State_ID 
where  s.State = 'Uttar Pradesh';

 


