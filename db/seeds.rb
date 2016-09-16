parm = User.create(username: "parm530", email: "parm@parm.com", password: "parm", gender: "male", weight: "200 lbs", height: "6'2", age: "23", goal: "build muscle")
omar = User.create(username: "sami4thewin", email: "mo@omar.com", password: "momar", gender: "male", weight: "150 lbs", height: "5'7", age: "22", goal: "build muscle")
demitry = User.create(username: "khaitd", email: "dem@d.com", password: "demitry", gender: "male", weight: "200 lbs", height: "5'9", age: "26", goal: "maintenance")
hafiz = User.create(username: "hrahman1", email: "hafiz@rahman.com", password: "hrah", gender: "male", weight: "115 lbs", height: "5'5", age: "25", goal: "fat loss")

chest = Type.create(name: "Chest")
legs = Type.create(name: "Legs")
abs = Type.create(name: "Abs")
arms = Type.create(name: "Arms")
back = Type.create(name: "Back")
triceps = Type.create(name: "Triceps")
shoulder = Type.create(name: "Shoulders")


ex1 = Exercise.create(name: "Dumbbell Bench Press", description: "1. Lie down on a flat bench with a dumbbell in each hand resting on top of your thighs. The palms of your hands will be facing each other.
2. Then, using your thighs to help raise the dumbbells up, lift the dumbbells one at a time so that you can hold them in front of you at shoulder width.
3. Once at shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. The dumbbells should be just to the sides of your chest, with your upper arm and forearm creating a 90 degree angle. Be sure to maintain full control of the dumbbells at all times. This will be your starting position.
4. Then, as you breathe out, use your chest to push the dumbbells up. Lock your arms at the top of the lift and squeeze your chest, hold for a second and then begin coming down slowly. Tip: Ideally, lowering the weight should take about twice as long as raising it.
5. Repeat the movement for the prescribed amount of repetitions of your training program")

ex1.types.push(chest, triceps)

ex2 = Exercise.create(name: "Incline Dumbbell Press", description: "1. Lie back on an incline bench with a dumbbell in each hand atop your thighs. The palms of your hands will be facing each other.
2. Then, using your thighs to help push the dumbbells up, lift the dumbbells one at a time so that you can hold them at shoulder width.
3. Once you have the dumbbells raised to shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. This will be your starting position.
4. Be sure to keep full control of the dumbbells at all times. Then breathe out and push the dumbbells up with your chest.
5. Lock your arms at the top, hold for a second, and then start slowly lowering the weight. Tip Ideally, lowering the weights should take about twice as long as raising them.
6. Repeat the movement for the prescribed amount of repetitions.
7. When you are done, place the dumbbells back on your thighs and then on the floor. This is the safest manner to release the dumbbells.")

ex2.types << chest

 
ex3 = Exercise.create(name: "Alternate Hammer Curl", description: "1. Stand up with your torso upright and a dumbbell in each hand being held at arms length. The elbows should be close to the torso.
2. The palms of the hands should be facing your torso. This will be your starting position.
3. While holding the upper arm stationary, curl the right weight forward while contracting the biceps as you breathe out. Continue the movement until your biceps is fully contracted and the dumbbells are at shoulder level. Hold the contracted position for a second as you squeeze the biceps. Tip: Only the forearms should move.
4. Slowly begin to bring the dumbbells back to starting position as your breathe in.
5. Repeat the movement with the left hand. This equals one repetition.
6. Continue alternating in this manner for the recommended amount of repetitions.")

ex3.types << arms


ex4 = Exercise.create(name: "Barbell Curl", description: "1. Stand up with your torso upright while holding a barbell at a shoulder-width grip. The palm of your hands should be facing forward and the elbows should be close to the torso. This will be your starting position.
2. While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move.
3. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard.
4. Slowly begin to bring the bar back to starting position as your breathe in.
5. Repeat for the recommended amount of repetitions.")

ex4.types << arms

ex5 = Exercise.create(name: "Ab Crunch Machine", description: "1. Select a light resistance and sit down on the ab machine placing your feet under the pads provided and grabbing the top handles. Your arms should be bent at a 90 degree angle as you rest the triceps on the pads provided. This will be your starting position.
2. At the same time, begin to lift the legs up as you crunch your upper torso. Breathe out as you perform this movement. Tip: Be sure to use a slow and controlled motion. Concentrate on using your abs to move the weight while relaxing your legs and feet.
3. After a second pause, slowly return to the starting position as you breathe in.
4. Repeat the movement for the prescribed amount of repetitions.")

ex5.types << abs

ex6 = Exercise.create(name: "Barbell Side Bend", description: "1. Stand up straight while holding a barbell placed on the back of your shoulders (slightly below the neck). Your feet should be shoulder width apart. This will be your starting position.
2. While keeping your back straight and your head up, bend only at the waist to the right as far as possible. Breathe in as you bend to the side. Then hold for a second and come back up to the starting position as you exhale. Tip: Keep the rest of the body stationary.
3. Now repeat the movement but bending to the left instead. Hold for a second and come back to the starting position.
4. Repeat for the recommended amount of repetitions.")

ex6.types << abs

ex7 = Exercise.create(name: "Bent Over Barbell Row", description: "1. Holding a barbell with a pronated grip (palms facing down), bend your knees slightly and bring your torso forward, by bending at the waist, while keeping the back straight until it is almost parallel to the floor. Tip: Make sure that you keep the head up. The barbell should hang directly in front of you as your arms hang perpendicular to the floor and your torso. This is your starting position.
2. Now, while keeping the torso stationary, breathe out and lift the barbell to you. Keep the elbows close to the body and only use the forearms to hold the weight. At the top contracted position, squeeze the back muscles and hold for a brief pause.
3. Then inhale and slowly lower the barbell back to the starting position.
4. Repeat for the recommended amount of repetitions.")

ex7.types << back

ex8 = Exercise.create(name: "Dumbbell Incline Row" , description: "1. Using a neutral grip, lean into an incline bench.
2. Take a dumbbell in each hand with a neutral grip, beginning with the arms straight. This will be your starting position.
3. Retract the shoulder blades and flex the elbows to row the dumbbells to your side.
4. Pause at the top of the motion, and then return to the starting position.")

ex8.types << back

ex9 = Exercise.create(name: "Axle Deadlift" , description: "1. Approach the bar so that it is centered over your feet. You feet should be about hip width apart. Bend at the hip to grip the bar at shoulder width, allowing your shoulder blades to protract. Typically, you would use an over/under grip.
2. With your feet and your grip set, take a big breath and then lower your hips and flex the knees until your shins contact the bar. Look forward with your head, keep your chest up and your back arched, and begin driving through the heels to move the weight upward.
3. After the bar passes the knees, aggressively pull the bar back, pulling your shoulder blades together as you drive your hips forward into the bar.
4. Lower the bar by bending at the hips and guiding it to the floor.")

ex9.types.push(back, legs)

ex10 = Exercise.create(name: "Hyperextensions", description: "1. Lie face down on a hyperextension bench, tucking your ankles securely under the footpads.
2. Adjust the upper pad if possible so your upper thighs lie flat across the wide pad, leaving enough room for you to bend at the waist without any restriction.
3. With your body straight, cross your arms in front of you (my preference) or behind your head. This will be your starting position. Tip: You can also hold a weight plate for extra resistance in front of you under your crossed arms.
4. Start bending forward slowly at the waist as far as you can while keeping your back flat. Inhale as you perform this movement. Keep moving forward until you feel a nice stretch on the hamstrings and you can no longer keep going without a rounding of the back. Tip: Never round the back as you perform this exercise. Also, some people can go farther than others. The key thing is that you go as far as your body allows you to without rounding the back.
5. Slowly raise your torso back to the initial position as you inhale. Tip: Avoid the temptation to arch your back past a straight line. Also, do not swing the torso at any time in order to protect the back from injury.
6. Repeat for the recommended amount of repetitions.")

ex10.types << back

ex11 = Exercise.create(name: "Band Skull Crusher", description: "1. Secure a band to the base of a rack or the bench. Lay on the bench so that the band is lined up with your head.
2. Take hold of the band, raising your elbows so that the upper arm is perpendicular to the floor. With the elbow flexed, the band should be above your head. This will be your starting position.
3. Extend through the elbow to straighten your arm, keeping your upper arm in place. Pause at the top of the motion, and return to the starting position.")

ex11.types << triceps

ex12 = Exercise.create(name: "Cable One Arm Tricep Extension", description: "1. With your right hand, grasp a single handle attached to the high-cable pulley using a supinated (underhand; palms facing up) grip. You should be standing directly in front of the weight stack.
2. Now pull the handle down so that your upper arm and elbow are locked in to the side of your body. Your upper arm and forearm should form an acute angle (less than 90-degrees). You can keep the other arm by the waist and you can have one leg in front of you and the other one back for better balance. This will be your starting position.
3. As you contract the triceps, move the single handle attachment down to your side until your arm is straight. Breathe out as you perform this movement. Tip: Only the forearms should move. Your upper arms should remain stationary at all times.
4. Squeeze the triceps and hold for a second in this contracted position.
5. Slowly return the handle to the starting position.
6. Repeat for the recommended amount of repetitions and then perform the same movement with the other arm.")

ex12.types << triceps

ex13 = Exercise.create(name: "Arnold Dumbbell Press", description: "1. Sit on an exercise bench with back support and hold two dumbbells in front of you at about upper chest level with your palms facing your body and your elbows bent. Tip: Your arms should be next to your torso. The starting position should look like the contracted portion of a dumbbell curl.
2. Now to perform the movement, raise the dumbbells as you rotate the palms of your hands until they are facing forward.
3. Continue lifting the dumbbells until your arms are extended above you in straight arm position. Breathe out as you perform this portion of the movement.
4. After a second pause at the top, begin to lower the dumbbells to the original position by rotating the palms of your hands towards you. Tip: The left arm will be rotated in a counter clockwise manner while the right one will be rotated clockwise. Breathe in as you perform this portion of the movement.
5. Repeat for the recommended amount of repetitions.")

ex13.types << shoulder

ex14 = Exercise.create(name: "Barbell Full Squat", description: "1. This exercise is best performed inside a squat rack for safety purposes. To begin, first set the bar on a rack just above shoulder level. Once the correct height is chosen and the bar is loaded, step under the bar and place the back of your shoulders (slightly below the neck) across it.
2. Hold on to the bar using both arms at each side and lift it off the rack by first pushing with your legs and at the same time straightening your torso.
3. Step away from the rack and position your legs using a shoulder-width medium stance with the toes slightly pointed out. Keep your head up at all times and maintain a straight back. This will be your starting position.
4. Begin to slowly lower the bar by bending the knees and sitting back with your hips as you maintain a straight posture with the head up. Continue down until your hamstrings are on your calves. Inhale as you perform this portion of the movement.
5. Begin to raise the bar as you exhale by pushing the floor with the heel or middle of your foot as you straighten the legs and extend the hips to go back to the starting position.
6. Repeat for the recommended amount of repetitions.")

ex14.types << legs

ex15 = Exercise.create(name: "Bodyweight Squat", description: "1. Stand with your feet shoulder width apart. You can place your hands behind your head. This will be your starting position.
2. Begin the movement by flexing your knees and hips, sitting back with your hips.
3. Continue down to full depth if you are able,and quickly reverse the motion until you return to the starting position. As you squat, keep your head and chest up and push your knees out.")

ex15.types << legs

ex16 = Exercise.create(name: "Cable Crunch", description: "1. Kneel below a high pulley that contains a rope attachment.
2. Grasp cable rope attachment and lower the rope until your hands are placed next to your face.
3. Flex your hips slightly and allow the weight to hyperextend the lower back. This will be your starting position.
4. With the hips stationary, flex the waist as you contract the abs so that the elbows travel towards the middle of the thighs. Exhale as you perform this portion of the movement and hold the contraction for a second.
5. Slowly return to the starting position as you inhale. Tip: Make sure that you keep constant tension on the abs throughout the movement. Also, do not choose a weight so heavy that the lower back handles the brunt of the work.
6. Repeat for the recommended amount of repetitions.")

ex16.types << abs

ex17 = Exercise.create(name: "Close-Grip EZ Bar Curl", description: "1. Stand up with your torso upright while holding an E-Z Curl Bar at the closer inner handle. The palm of your hands should be facing forward and they should be slightly tilted inwards due to the shape of the bar. The elbows should be close to the torso. This will be your starting position.
2. While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move.
3. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard.
4. Slowly begin to bring the bar back to starting position as your breathe in.
5. Repeat for the recommended amount of repetitions.")

ex17.types << arms

ex18 = Exercise.create(name: "Dumbbell Lunges", description: "1. Stand with your torso upright holding two dumbbells in your hands by your sides. This will be your starting position.
2. Step forward with your right leg around 2 feet or so from the foot being left stationary behind and lower your upper body down, while keeping the torso upright and maintaining balance. Inhale as you go down. Note: As in the other exercises, do not allow your knee to go forward beyond your toes as you come down, as this will put undue stress on the knee joint. Make sure that you keep your front shin perpendicular to the ground.
3. Using mainly the heel of your foot, push up and go back to the starting position as you exhale.
4. Repeat the movement for the recommended amount of repetitions and then perform with the left leg.")

ex18.types << legs

ex19 = Exercise.create(name: "Barbell Shrug", description: "1. Stand up straight with your feet at shoulder width as you hold a barbell with both hands in front of you using a pronated grip (palms facing the thighs). Tip: Your hands should be a little wider than shoulder width apart. You can use wrist wraps for this exercise for a better grip. This will be your starting position.
2. Raise your shoulders up as far as you can go as you breathe out and hold the contraction for a second. Tip: Refrain from trying to lift the barbell by using your biceps.
3. Slowly return to the starting position as you breathe in.
4. Repeat for the recommended amount of repetitions.")

ex19.types << shoulder

ex20 = Exercise.create(name: "Cable Crossover", description: "1. To get yourself into the starting position, place the pulleys on a high position (above your head), select the resistance to be used and hold the pulleys in each hand.
2. Step forward in front of an imaginary straight line between both pulleys while pulling your arms together in front of you. Your torso should have a small forward bend from the waist. This will be your starting position.
3. With a slight bend on your elbows in order to prevent stress at the biceps tendon, extend your arms to the side (straight out at both sides) in a wide arc until you feel a stretch on your chest. Breathe in as you perform this portion of the movement. Tip: Keep in mind that throughout the movement, the arms and torso should remain stationary; the movement should only occur at the shoulder joint.
4. Return your arms back to the starting position as you breathe out. Make sure to use the same arc of motion used to lower the weights.
5. Hold for a second at the starting position and repeat the movement for the prescribed amount of repetitions.")

ex20.types << chest
