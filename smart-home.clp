;--------------Welcome Message--------------------------------------

(defrule start
   =>
   (printout t crlf "Welcome to the Smart Home Expert System!" crlf)
   (assert (user-started))
)

;------------Taking Responses from the User Interface-----------------

(defrule user-started
   =>
   (printout t crlf crlf "Is someone at home?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (at-home (read)))
)

(defrule at-home-yes
   ?f <- (at-home 1)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the current temperature comfortable?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (comfortable-temperature (read)))
)

(defrule comfortable-temperature-no
   ?f <- (comfortable-temperature 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is it daytime?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (daytime (read)))
)

(defrule daytime-yes
   ?f <- (daytime 1)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the sun shining intensely?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (intense-sunlight (read)))
)

(defrule daytime-no
   ?f <- (daytime 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the Smart Home mode set to 'Away'?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (away-mode (read)))
)

(defrule away-mode-no
   ?f <- (away-mode 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is it a specific time to adjust the temperature?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (specific-time (read)))
)

(defrule specific-time-no
   ?f <- (specific-time 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the air quality poor?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (poor-air-quality (read)))
)

(defrule at-home-no
   ?f <- (at-home 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the Smart Home mode set to 'Vacation'?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (vacation-mode (read)))
)

(defrule vacation-mode-no
   ?f <- (vacation-mode 2)
   =>
   (retract ?f)
   (printout t crlf crlf "Is the air quality poor?" 
            crlf " 1. Yes" 
            crlf " 2. No" 
            crlf "Enter Your Answer (1|2): ")
   (assert (poor-air-quality-vacation (read)))
)


;---------------Actions Taken by the System------------------------

(defrule comfortable-temperature-yes
   ?f <- (comfortable-temperature 1)
   =>
   (printout t crlf crlf "Action: Let users enjoy the comfort." crlf)
)

(defrule intense-sunlight-yes
   ?f <- (intense-sunlight 1)
   =>
   (printout t crlf crlf "Action: Adjust blinds/curtains to block direct sunlight." crlf)
)

(defrule intense-sunlight-no
   ?f <- (intense-sunlight 2)
   =>
   (printout t crlf crlf "Action: Leave blinds/curtains as they are." crlf)
)

(defrule away-mode-yes
   ?f <- (away-mode 1)
   =>
   (printout t crlf crlf "Action: Set temperature to energy-saving level." crlf)
)

(defrule specific-time-yes
   ?f <- (specific-time 1)
   =>
   (printout t crlf crlf "Action: Adjust temperature based on scheduled settings." crlf)
)

(defrule poor-air-quality-yes
   ?f <- (poor-air-quality 1)
   =>
   (printout t crlf crlf "Action: Turn on air purifier or ventilation system." crlf)
)

(defrule poor-air-quality-no
   ?f <- (poor-air-quality 2)
   =>
   (printout t crlf crlf "Action: Bypass the action of turning on the air purifier or ventilation system." crlf)
)

(defrule vacation-mode-yes
   ?f <- (vacation-mode 1)
   =>
   (printout t crlf crlf "Action: Set climate to energy-saving mode, turn off unnecessary devices, activate security measures." crlf)
)

(defrule poor-air-quality-vacation-yes
   ?f <- (poor-air-quality-vacation 1)
   =>
   (printout t crlf crlf "Action: Run air purifier on low mode, notify user about air quality improvement." crlf)
)

(defrule poor-air-quality-vacation-no
   ?f <- (poor-air-quality-vacation 2)
   =>
   (printout t crlf crlf "Action: Bypass the action of turning on the air purifier or ventilation system." crlf)
)
