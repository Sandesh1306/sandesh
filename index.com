<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>JSPM University | CampusCircuit Tech Hub</title>
    <style>
        :root {
            --bg: #f5f3ec;
            --card: #fffdf8;
            --ink: #202b28;
            --muted: #69736e;
            --line: #e1e5dc;
            --green: #176b50;
            --lime: #d8f36a;
            --nav: #173b30;
            --soft: #e9f0e7
        }

        body.dark {
            --bg: #111916;
            --card: #1a2420;
            --ink: #eef4ed;
            --muted: #a4b2a8;
            --line: #303d35;
            --green: #8fdbad;
            --nav: #101b16;
            --soft: #26372e
        }

        * {
            box-sizing: border-box
        }

        html {
            scroll-behavior: smooth
        }

        body {
            margin: 0;
            background: var(--bg);
            color: var(--ink);
            font: 15px Arial, sans-serif
        }

        a {
            color: inherit;
            text-decoration: none
        }

        button,
        input,
        select,
        textarea {
            font: inherit
        }

        .wrap {
            max-width: 1120px;
            width: 92%;
            margin: auto
        }

        header {
            background: var(--nav);
            color: white;
            position: sticky;
            top: 0;
            z-index: 5
        }

        .nav {
            height: 72px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 18px
        }

        .brand {
            font-size: 20px;
            font-weight: 900;
            letter-spacing: -.5px
        }

        .brand small {
            display: block;
            font-size: 9px;
            color: #c5d9c9;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-top: 4px
        }

        .links {
            display: flex;
            gap: 20px;
            font-size: 13px
        }

        .theme,
        .cta {
            border: 1px solid #ffffff50;
            border-radius: 7px;
            padding: 10px 12px;
            background: #ffffff10;
            color: white;
            cursor: pointer
        }

        .cta {
            background: var(--lime);
            color: #213329;
            border-color: var(--lime);
            font-weight: bold
        }

        .hero {
            background: var(--nav);
            color: white;
            padding: 65px 0
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 40px
        }

        .eyebrow {
            font-size: 10px;
            letter-spacing: 2px;
            text-transform: uppercase;
            color: var(--green);
            font-weight: 900
        }

        .hero .eyebrow {
            color: var(--lime)
        }

        h1 {
            font-size: clamp(42px, 6vw, 68px);
            line-height: .98;
            letter-spacing: -3px;
            margin: 22px 0
        }

        h1 em {
            color: var(--lime);
            font-family: Georgia, serif;
            font-weight: normal
        }

        .hero p {
            line-height: 1.8;
            color: #d0ddd3;
            max-width: 500px
        }

        .button {
            display: inline-block;
            margin: 12px 8px 0 0;
            padding: 13px 16px;
            background: var(--lime);
            color: #203329;
            border-radius: 7px;
            font-weight: bold
        }

        .button.alt {
            background: transparent;
            border: 1px solid #ffffff60;
            color: white
        }

        .hero-image {
            height: 330px;
            position: relative;
            border-radius: 45% 45% 10px 10px;
            overflow: hidden;
            border: 1px solid #d8f36a80
        }

        .hero-image img {
            width: 100%;
            height: 100%;
            object-fit: cover
        }

        .hero-image span {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 25px;
            color: white;
            background: linear-gradient(transparent, #10271f)
        }

        .ticker {
            background: var(--lime);
            padding: 12px;
            text-align: center;
            font-size: 11px;
            letter-spacing: 2px;
            font-weight: 900;
            color: #203329
        }

        .section {
            padding: 65px 0
        }

        .heading {
            display: flex;
            justify-content: space-between;
            align-items: end;
            gap: 20px;
            margin-bottom: 25px
        }

        h2 {
            font-size: 36px;
            letter-spacing: -1.5px;
            margin: 10px 0
        }

        .sub {
            color: var(--muted);
            line-height: 1.7;
            font-size: 13px
        }

        .toolbar {
            display: flex;
            gap: 10px;
            margin: 20px 0 15px;
            padding: 10px;
            border: 1px solid var(--line);
            border-radius: 8px;
            background: var(--card)
        }

        .toolbar input {
            flex: 1;
            min-width: 80px;
            border: 0;
            background: transparent;
            color: var(--ink);
            padding: 9px;
            outline: 0
        }

        .toolbar select,
        .field input,
        .field select,
        .field textarea {
            border: 1px solid var(--line);
            background: var(--bg);
            color: var(--ink);
            padding: 11px;
            border-radius: 6px
        }

        .filters {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
            margin-bottom: 22px
        }

        .filter {
            border: 1px solid var(--line);
            background: var(--card);
            color: var(--muted);
            padding: 9px 12px;
            border-radius: 5px;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer
        }

        .filter.active {
            background: var(--nav);
            color: var(--lime)
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px
        }

        .event {
            border: 1px solid var(--line);
            border-radius: 10px;
            overflow: hidden;
            background: var(--card);
            display: flex;
            flex-direction: column
        }

        .event-img {
            height: 165px;
            position: relative
        }

        .event-img img {
            width: 100%;
            height: 100%;
            object-fit: cover
        }

        .date {
            position: absolute;
            top: 10px;
            left: 10px;
            background: var(--card);
            padding: 8px;
            border-radius: 5px;
            text-align: center;
            font-size: 10px;
            font-weight: bold
        }

        .date b {
            display: block;
            font-size: 20px
        }

        .event-body {
            padding: 17px;
            display: flex;
            flex-direction: column;
            flex: 1
        }

        .tag {
            background: var(--soft);
            color: var(--green);
            padding: 6px 8px;
            font-size: 9px;
            font-weight: bold;
            letter-spacing: 1px;
            align-self: flex-start;
            text-transform: uppercase
        }

        .event h3 {
            margin: 12px 0 7px
        }

        .event p {
            font-size: 12px;
            color: var(--muted);
            line-height: 1.7
        }

        .meta {
            font-size: 11px;
            color: var(--muted);
            margin-top: auto;
            line-height: 1.8
        }

        .event-bottom {
            border-top: 1px solid var(--line);
            margin-top: 12px;
            padding-top: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 8px
        }

        .event-bottom button {
            border: 0;
            border-radius: 5px;
            background: var(--soft);
            color: var(--green);
            padding: 9px;
            font-size: 11px;
            font-weight: bold;
            cursor: pointer
        }

        .band {
            background: var(--nav);
            color: white;
            padding: 35px 0
        }

        .band-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px
        }

        .band b {
            font: 23px Georgia, serif
        }

        .band p {
            color: #c5d6c9;
            font-size: 12px;
            line-height: 1.7
        }

        .register {
            background: var(--soft)
        }

        .reg-grid {
            display: grid;
            grid-template-columns: .8fr 1.2fr;
            gap: 35px
        }

        .form-card {
            background: var(--card);
            padding: 25px;
            border: 1px solid var(--line);
            border-radius: 10px
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 7px
        }

        .field label {
            font-size: 11px;
            font-weight: bold
        }

        .field.full {
            grid-column: 1/-1
        }

        .field textarea {
            min-height: 70px
        }

        .check {
            display: flex;
            gap: 8px;
            font-size: 11px;
            color: var(--muted);
            margin: 16px 0
        }

        .submit {
            width: 100%;
            background: var(--nav);
            color: var(--lime);
            border: 0;
            padding: 14px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer
        }

        .success {
            display: none;
            margin-top: 12px;
            padding: 12px;
            background: var(--soft);
            color: var(--green);
            line-height: 1.6;
            border-radius: 6px
        }

        .success.show {
            display: block
        }

        .table-wrap {
            overflow: auto;
            background: var(--card);
            border: 1px solid var(--line);
            border-radius: 8px
        }

        .events-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px
        }

        .events-table th,
        .events-table td {
            padding: 14px;
            text-align: left;
            border-bottom: 1px solid var(--line);
            font-size: 12px
        }

        .events-table th {
            background: var(--soft);
            color: var(--muted);
            font-size: 10px;
            text-transform: uppercase
        }

        .cancel {
            border: 0;
            background: #f8e7e4;
            color: #a13b2f;
            padding: 7px;
            border-radius: 5px;
            cursor: pointer
        }

        footer {
            background: var(--nav);
            color: white;
            padding: 27px 0;
            font-size: 11px
        }

        .footer {
            display: flex;
            justify-content: space-between;
            gap: 20px
        }

        .empty {
            text-align: center;
            padding: 35px;
            color: var(--muted);
            grid-column: 1/-1
        }

        @media(max-width:760px) {
            .links {
                display: none
            }

            .hero-grid,
            .reg-grid {
                grid-template-columns: 1fr
            }

            .hero-image {
                height: 260px
            }

            .grid {
                grid-template-columns: 1fr 1fr
            }

            .band-grid {
                grid-template-columns: 1fr
            }

            .heading {
                display: block
            }

            .form-grid {
                grid-template-columns: 1fr
            }

            .field.full {
                grid-column: auto
            }
        }

        @media(max-width:480px) {
            .grid {
                grid-template-columns: 1fr
            }

            .toolbar {
                flex-wrap: wrap
            }

            .toolbar input {
                flex-basis: 100%
            }

            .toolbar select {
                flex: 1;
                min-width: 0
            }

            .hero {
                padding: 45px 0
            }

            .footer {
                flex-direction: column
            }
        }
    </style>
</head>

<body>
    <header>
        <div class="wrap nav"><a class="brand" href="#home">▣ JSPM University<small>CAMPUSCIRCUIT · TECH HUB</small></a>
            <nav class="links"><a href="#events">Tech calendar</a><a href="#society">Community</a><a
                    href="#my-events">My registrations</a><a href="#register">Register</a></nav>
            <div><button class="theme" id="theme">☾ Dark mode</button> <a class="cta" href="#events">Explore ↗</a></div>
        </div>
    </header>
    <section class="hero" id="home">
        <div class="wrap hero-grid">
            <div>
                <div class="eyebrow">✳ JSPM University · Student-led tech community</div>
                <h1>Where campus<br>culture meets<br><em>code.</em></h1>
                <p>Your college's home for hackathons, AI labs, coding battles and builder meetups. Find your team, ship
                    your ideas, and make your CSE years count.</p><a class="button" href="#events">Explore tech events
                    ↗</a><a class="button alt" href="#register">Get involved ↓</a>
                <p><b>08</b> curated events &nbsp; · &nbsp; <b>CSE + AI</b> &nbsp; · &nbsp; Campus season 2026–27</p>
            </div>
            <div class="hero-image"><img
                    src="https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1000&q=85"
                    alt="Students working together on laptops"><span><small>THE NEXT GENERATION OF
                        BUILDERS</small><br><b style="font:27px Georgia">Think it. Build it. Show the campus.</b></span>
            </div>
        </div>
    </section>
    <div class="ticker">CODE TOGETHER ✳ BUILD RESPONSIBLY ✳ LEARN BY SHIPPING ✳ MAKE CAMPUS HISTORY</div>
    <section class="section" id="events">
        <div class="wrap">
            <div class="heading">
                <div>
                    <div class="eyebrow">THE STUDENT TECH CALENDAR</div>
                    <h2>Pick a challenge.<br>Make something real.</h2>
                    <p class="sub">Hand-picked technical events for CSE, AI/ML, cybersecurity, cloud and robotics
                        students.</p>
                </div>
                <p class="sub">FALL / SPRING<br><b>2026–27 Society Programme</b></p>
            </div>
            <div class="toolbar">⌕ <input id="search" placeholder="Search events, AI, coding, venues..."
                    aria-label="Search events"><select id="sort">
                    <option value="date">Soonest first</option>
                    <option value="name">Name A–Z</option>
                </select><select id="month">
                    <option value="all">All months</option>
                </select></div>
            <div class="filters" id="filters"><button class="filter active" data-cat="All">All tech
                    events</button><button class="filter" data-cat="Hackathon">Hackathons</button><button class="filter"
                    data-cat="AI & ML">AI & ML</button><button class="filter" data-cat="Coding">Coding</button><button
                    class="filter" data-cat="Cybersecurity">Cybersecurity</button><button class="filter"
                    data-cat="Cloud & DevOps">Cloud & DevOps</button><button class="filter"
                    data-cat="Robotics">Robotics</button></div>
            <div class="grid" id="grid"></div>
        </div>
    </section>
    <section class="band" id="society">
        <div class="wrap band-grid">
            <div><b>Not just another event page.</b>
                <p>A campus society vibe: discover, collaborate, compete, and share what you build.</p>
            </div>
            <div><b>For curious CSE minds.</b>
                <p>From first-time coders to AI experimenters, find an event that fits your next step.</p>
            </div>
            <div><b>Bring your people.</b>
                <p>Meet teammates, get feedback, and turn classroom concepts into portfolio projects.</p>
            </div>
        </div>
    </section>
    <section class="section register" id="register">
        <div class="wrap reg-grid">
            <div>
                <div class="eyebrow">CLAIM YOUR SPOT</div>
                <h2>Your next project could start here.</h2>
                <p class="sub">Choose a challenge, register with your student details, and add it to your campus tech
                    journey.</p>
                <p class="sub">✓ One form for all tech events<br><br>✓ See your saved registrations<br><br>✓ Cancel a
                    demo registration any time<br><br>✓ Responsive college-themed design</p>
                <p class="sub"><small>Demo only: details stay in this browser. No college server is connected.</small>
                </p>
            </div>
            <div class="form-card">
                <h3>Event registration</h3>
                <p class="sub">Student details · Select your event · Confirm your place</p>
                <form id="form">
                    <div class="form-grid">
                        <div class="field"><label>Full name *</label><input name="name" required minlength="2"
                                placeholder="e.g. Aarya Patil"></div>
                        <div class="field"><label>College email *</label><input name="email" type="email" required
                                placeholder="you@college.edu"></div>
                        <div class="field"><label>Student ID / PRN *</label><input name="prn" required
                                placeholder="e.g. 24CSE1024"></div>
                        <div class="field"><label>Year of study *</label><select name="year" required>
                                <option value="">Select year</option>
                                <option>1st Year</option>
                                <option>2nd Year</option>
                                <option>3rd Year</option>
                                <option>4th Year</option>
                            </select></div>
                        <div class="field"><label>Department *</label><select name="dept" required>
                                <option value="">Select department</option>
                                <option>Computer Science & Engineering</option>
                                <option>Artificial Intelligence & Machine Learning</option>
                                <option>Information Technology</option>
                                <option>Electronics & Telecommunication</option>
                                <option>Other</option>
                            </select></div>
                        <div class="field"><label>Choose event *</label><select name="event" id="eventSelect" required>
                                <option value="">Choose event</option>
                            </select></div>
                        <div class="field full"><label>Team name / note (optional)</label><textarea name="notes"
                                maxlength="300"
                                placeholder="Team name, project idea, or note for organisers"></textarea></div>
                    </div><label class="check"><input type="checkbox" required> I confirm these details are correct and
                        understand this is a frontend demo.</label><button class="submit">Confirm registration
                        ↗</button>
                    <div class="success" id="success" role="status"></div>
                </form>
            </div>
        </div>
    </section>
    <section class="section" id="my-events">
        <div class="wrap">
            <div class="eyebrow">YOUR CAMPUS ITINERARY</div>
            <h2>My registrations.</h2>
            <p class="sub">Your saved event sign-ups, all in one place.</p>
            <div class="table-wrap" style="margin-top:22px">
                <table class="events-table">
                    <thead>
                        <tr>
                            <th>Event</th>
                            <th>Date</th>
                            <th>Venue</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody id="rows">
                        <tr>
                            <td colspan="5" class="empty">No registrations yet — pick a challenge above.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    <footer>
        <div class="wrap footer">
            <div><b>JSPM University · CampusCircuit</b><br><br>Student-led spirit. Tech-first experiences.</div>
            <div><a href="#home">Back to top ↑</a> &nbsp; · &nbsp; <a href="#events">Tech calendar</a> &nbsp; · &nbsp;
                <a href="#register">Join an event</a></div>
        </div>
    </footer>
    <script>
        const events = [
            { id: 'hacknova', title: 'HackNova 2026', cat: 'Hackathon', date: '2026-11-07', time: '9:00 AM – next day', venue: 'Innovation Lab · Block A', desc: 'A 24-hour campus hackathon to turn a real-world problem into a working prototype. Form a team, build fast, demo boldly.', img: 'photo-1516321318423-f06f85e504b3', code: 'HC / 001', spots: 42 },
            { id: 'aiforge', title: 'AI Forge: Build with LLMs', cat: 'AI & ML', date: '2026-11-15', time: '10:00 AM – 4:00 PM', venue: 'AI Research Lab', desc: 'Prototype an AI-powered campus assistant using LLM concepts, retrieval, evaluation and responsible design in a guided build sprint.', img: 'photo-1677442136019-21780ecad995', code: 'AI / 002', spots: 30 },
            { id: 'codeclash', title: 'CodeClash Inter-College', cat: 'Coding', date: '2026-11-28', time: '11:00 AM – 2:00 PM', venue: 'Computer Centre · Lab 2', desc: 'Race the clock across algorithms, data structures and problem-solving rounds. Solo entries welcome; leaderboard glory is not.', img: 'photo-1515879218367-8466d910aaa4', code: 'CP / 003', spots: 64 },
            { id: 'cybershield', title: 'CyberShield CTF', cat: 'Cybersecurity', date: '2026-12-10', time: '9:30 AM – 3:30 PM', venue: 'Network Security Lab', desc: 'Solve capture-the-flag puzzles in web security, digital forensics and cryptography in a legal lab environment.', img: 'photo-1550751827-4bd374c3f58b', code: 'SEC / 004', spots: 36 },
            { id: 'visionlab', title: 'VisionLab: CV Sprint', cat: 'AI & ML', date: '2026-12-18', time: '10:00 AM – 5:00 PM', venue: 'Machine Learning Studio', desc: 'Experiment with image datasets, model evaluation and computer vision prototypes. Bring a laptop and curiosity about how machines see.', img: 'photo-1620712943543-bcc4688e7485', code: 'AI / 005', spots: 25 },
            { id: 'devstack', title: 'DevStack: Cloud & DevOps', cat: 'Cloud & DevOps', date: '2027-01-09', time: '1:00 PM – 5:00 PM', venue: 'Cloud Computing Lab', desc: 'Get hands-on with CI/CD, containers and deployment workflows by taking a small app from local code to a demo environment.', img: 'photo-1451187580459-43490279c0fa', code: 'OPS / 006', spots: 32 },
            { id: 'roborally', title: 'RoboRally: Autonomous Bots', cat: 'Robotics', date: '2027-01-23', time: '9:00 AM – 4:00 PM', venue: 'Embedded Systems Workshop', desc: 'Build, test and tune a small autonomous bot through a friendly obstacle course with student mentors.', img: 'photo-1485827404703-89b55fcc595e', code: 'ROB / 007', spots: 20 },
            { id: 'opensource', title: 'Open Source Sprint Day', cat: 'Coding', date: '2027-02-06', time: '10:00 AM – 4:00 PM', venue: 'Project Commons · Block C', desc: 'Learn to pick a beginner-friendly issue, understand a repository, make a clean pull request and collaborate like an open-source team.', img: 'photo-1556075798-4825dfaaf498', code: 'OSS / 008', spots: 40 }];
        const $ = s => document.querySelector(s), key = 'campuscircuit_regs'; let cat = 'All'; const regs = () => JSON.parse(localStorage.getItem(key) || '[]'), save = x => localStorage.setItem(key, JSON.stringify(x)), dateFmt = d => new Date(d + 'T12:00:00').toLocaleDateString('en-IN', { day: 'numeric', month: 'short', year: 'numeric' }); function setup() { [...new Set(events.map(e => e.date.slice(0, 7)))].forEach(m => { let o = document.createElement('option'); o.value = m; o.textContent = new Date(m + '-01T12:00:00').toLocaleDateString('en-IN', { month: 'long', year: 'numeric' }); $('#month').append(o) }); events.forEach(e => { let o = document.createElement('option'); o.value = e.id; o.textContent = e.title + ' — ' + dateFmt(e.date); $('#eventSelect').append(o) }); render(); renderRegs() }
        function render() { let list = events.filter(e => (cat === 'All' || e.cat === cat) && ($('#month').value === 'all' || e.date.startsWith($('#month').value)) && (e.title + ' ' + e.cat + ' ' + e.desc + ' ' + e.venue).toLowerCase().includes($('#search').value.toLowerCase())); list.sort((a, b) => $('#sort').value === 'name' ? a.title.localeCompare(b.title) : a.date.localeCompare(b.date)); $('#grid').innerHTML = list.length ? '' : '<div class="empty">No matching events. Try another filter.</div>'; list.forEach(e => { let d = new Date(e.date + 'T12:00:00'), day = d.toLocaleDateString('en-IN', { day: '2-digit' }), mon = d.toLocaleDateString('en-IN', { month: 'short' }), registered = regs().some(r => r.event === e.id); let el = document.createElement('article'); el.className = 'event'; el.innerHTML = `<div class="event-img"><img loading="lazy" src="https://images.unsplash.com/${e.img}?auto=format&fit=crop&w=900&q=80" alt="${e.title} photo"><div class="date"><b>${day}</b>${mon}</div></div><div class="event-body"><span class="tag">${e.cat}</span><h3>${e.title}</h3><p>${e.desc}</p><div class="meta">◷ ${e.time}<br>⌖ ${e.venue}</div><div class="event-bottom"><span class="sub">${e.spots} demo spots</span><button data-pick="${e.id}">${registered ? 'Registered ✓' : 'Reserve ↗'}</button></div></div>`; $('#grid').append(el) }) }
        function renderRegs() { let rs = regs(); $('#rows').innerHTML = ''; if (!rs.length) { $('#rows').innerHTML = '<tr><td colspan="5" class="empty">No registrations yet — pick a challenge above.</td></tr>'; return } rs.slice().reverse().forEach(r => { let e = events.find(x => x.id === r.event), tr = document.createElement('tr'); if (!e) return; tr.innerHTML = `<td><b>${e.title}</b><br><small>${r.name} · ${r.year}</small></td><td>${dateFmt(e.date)}</td><td>${e.venue}</td><td>✓ Registered</td><td><button class="cancel" data-cancel="${r.id}">Cancel</button></td>`; $('#rows').append(tr) }) }
        $('#filters').onclick = e => { let b = e.target.closest('[data-cat]'); if (!b) return; cat = b.dataset.cat; document.querySelectorAll('.filter').forEach(x => x.classList.toggle('active', x === b)); render() };['search', 'sort', 'month'].forEach(id => $('#' + id).addEventListener(id === 'search' ? 'input' : 'change', render)); $('#grid').onclick = e => { let b = e.target.closest('[data-pick]'); if (b) { $('#eventSelect').value = b.dataset.pick; $('#register').scrollIntoView({ behavior: 'smooth' }); $('#form').elements.name.focus() } }; $('#form').onsubmit = e => { e.preventDefault(); let f = e.currentTarget; if (!f.reportValidity()) return; let d = new FormData(f), event = d.get('event'), email = String(d.get('email')).trim(); if (regs().some(r => r.event === event && r.email.toLowerCase() === email.toLowerCase())) { $('#success').textContent = 'You are already registered for this event with this email.'; $('#success').classList.add('show'); return } let r = { id: Date.now().toString(), name: String(d.get('name')).trim(), email, prn: d.get('prn'), year: d.get('year'), dept: d.get('dept'), event, notes: d.get('notes') }; save([...regs(), r]); let ev = events.find(x => x.id === event); $('#success').innerHTML = '<b>You are on the list, ' + r.name.replace(/[<>&"]/g, '') + '!</b><br>Registered for <b>' + ev.title + '</b> on ' + dateFmt(ev.date) + '. Saved in this browser.'; $('#success').classList.add('show'); f.reset(); render(); renderRegs(); $('#my-events').scrollIntoView({ behavior: 'smooth' }) }; $('#rows').onclick = e => { let b = e.target.closest('[data-cancel]'); if (!b) return; save(regs().filter(r => r.id !== b.dataset.cancel)); render(); renderRegs() }; function theme(t) { document.body.classList.toggle('dark', t === 'dark'); $('#theme').textContent = t === 'dark' ? '☀ Light mode' : '☾ Dark mode'; localStorage.setItem('campuscircuit_theme', t) } theme(localStorage.getItem('campuscircuit_theme') || 'light'); $('#theme').onclick = () => theme(document.body.classList.contains('dark') ? 'light' : 'dark'); setup();
    </script>
</body>

</html>
