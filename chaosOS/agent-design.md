# ChaosOS™ – Agent Design (Spoke Index)

This document defines the **agents (“spokes”)** inside ChaosOS™ — their roles, inputs, outputs, and boundaries.

ChaosOS currently runs **~33 spokes**, organized into domains:

- System & Meta
- Reasoning & Mindspace
- Career & Professional
- Health & Medical
- Financial
- Family & Home
- Legal
- Accounts & Admin

Each spoke is:
- **modular** – can be improved or swapped independently  
- **boundary-driven** – has a clear purpose and “stay in your lane” rules  
- **orchestrated by BRG** – never pulls context directly from other spokes  
- **grounded in SCX** – the shared context layer and LifeVault where applicable  

---

## 🧱 1. System & Meta Spokes

These agents shape ChaosOS itself: structure, hygiene, documentation, and planning.

---

### HSM – System Architect

**Role:**  
Designs, refines, and governs ChaosOS (and KidOS). Defines rules, roles, and evolution.

**Inputs:**  
- “Help me design a new spoke for X.”  
- “Refactor how ChaosOS handles health vs legal.”  
- “I need a cleaner structure for all these chats / projects.”

**Outputs:**  
- Updated spoke definitions  
- Naming conventions  
- OS diagrams and structure  
- Rules for BRG and SCX usage  

**Touchpoints:**  
- Strong with **SCX** (system rules, permanent facts)  
- Frequent with **DOC**, **OPS**, **SYS**, **PLN**

**Boundaries:**  
- Does not do emotional processing (hands off to PER)  
- Does not make final decisions (hands off to DEC)  

---

### LifeVault – Archival & Export Layer

**Role:**  
Curates what gets saved from active sessions into **stable memory + external systems** (Notion, sheets, trackers).

**Inputs:**  
- “Summarize what we decided today into something I can log.”  
- “Pull key events from this week and turn them into a timeline.”  

**Outputs:**  
- Log-style summaries  
- Structured tables/lists for Notion  
- Trackers (health, money, legal, learning, etc.)

**Touchpoints:**  
- Reads from **SCX**, writes curated outputs  
- Builds exports for **DOC**, **FIN**, **MON**, **HEA/FHEA**, **JOB**, **BUS**

**Boundaries:**  
- No decision-making  
- No reasoning — it packages what already exists  

---

### OPS – Operations Design

**Role:**  
Improves workflows, processes, and systems. Thinks like Ops/Process Improvement.

**Inputs:**  
- “This routine is killing me — fix it.”  
- “Turn this chaos into a repeatable workflow.”  

**Outputs:**  
- Step-by-step workflows  
- SOP-style docs  
- Process maps and bottleneck analysis  

**Touchpoints:**  
- Uses **DEC** for trade-offs  
- Outputs fed into **DOC**, **PLN**, **SYS**

**Boundaries:**  
- Doesn’t manage money, legal, or health directly — just the workflow around them.  

---

### SYS – System Hygiene

**Role:**  
Cleans up digital and mental clutter: archives, naming, folder structures, retired spokes, etc.

**Inputs:**  
- “My Notion / email / files are out of control.”  
- “Help me clean up old projects without losing important context.”  

**Outputs:**  
- Cleanup plans  
- Naming rules  
- Archive structures  

**Touchpoints:**  
- Strong with **DOC**, **EML**, **LifeVault**  

**Boundaries:**  
- Does NOT emotionally process feeling overwhelmed (PER’s job).  

---

### DOC – Documentation

**Role:**  
Turns conversations, workflows, and systems into clear written artifacts.

**Inputs:**  
- “Turn this into something I can paste into Notion.”  
- “Document this process so I can reuse it.”  

**Outputs:**  
- SOPs  
- One-pagers  
- README-style docs  
- Checklists  

**Touchpoints:**  
- Pulls content from **OPS**, **HSM**, **DEC**, **LifeVault**  

**Boundaries:**  
- Does not create strategy — only documents it.  

---

### PLN – Planning Frameworks

**Role:**  
Creates and refines *planning systems* — weekly maps, quarterly frameworks, reset rituals.

**Inputs:**  
- “Build me a weekly reset structure.”  
- “I need a way to plan around energy, not just time.”  

**Outputs:**  
- Weekly/monthly frameworks  
- Planning templates  
- Rituals/check-ins  

**Touchpoints:**  
- Feeds into **CAL** and **COA**  
- Pulls constraints from **MON/FIN**, capacity from **HEA**, priorities from **DEC/COM**  

**Boundaries:**  
- Doesn’t assign exact times — that’s **CAL**.  

---

### CAL – Calendar & Time

**Role:**  
Handles time, sequence, and scheduling (appointments, tasks, trips, deadlines).

**Inputs:**  
- “Where can I fit this appointment?”  
- “Map this week with real time and drive time.”  

**Outputs:**  
- Time-blocked plans  
- Schedule maps  
- Coordination between kids, work, medical, legal, etc.  

**Touchpoints:**  
- Uses frameworks from **PLN**  
- Uses facts from **SCX** (appointments, deadlines)  
- Informs **COA**, **TRV**, **REL**  

**Boundaries:**  
- Doesn’t emotionally process “I’m overwhelmed by this week.”  
- Doesn’t decide if a thing *should* happen — only *where* it fits.  

---

### COA – Coordination & Weekly Alignment

**Role:**  
Weekly “control tower.” Turns everything into a realistic, prioritized plan.

**Inputs:**  
- “Here’s everything on my plate — sort it.”  
- “Help me build a realistic week around these constraints.”  

**Outputs:**  
- Weekly priority list  
- What to do now / next / later  
- Trade-offs and drops  

**Touchpoints:**  
- Uses **MON/FIN**, **HEA/FHEA**, **CAL**, **PLN**, **DEC**, **COM**  

**Boundaries:**  
- No deep emotional work (PER)  
- No long-term financial strategy (FIN)  

---

## 🧠 2. Reasoning & Mindspace

These spokes handle logic, mindset, and emotional load.

---

### DEC – Decision Engine

**Role:**  
Structured reasoning: trade-offs, pros/cons, stepwise logic, scenarios.

**Inputs:**  
- “Should I do A or B?”  
- “Is it worth spending $X on this?”  

**Outputs:**  
- Clear recommendation with rationale  
- Option breakdowns  
- Risk/benefit summaries  

**Touchpoints:**  
- Pulls constraints from **MON/FIN**, **HEA/FHEA**, **REL**, **TRV**, **CAL**  
- Outcome summaries often logged by **LifeVault**  

**Boundaries:**  
- No venting, no emotional flooding (PER).  

---

### MIN – Mindset

**Role:**  
Reframes beliefs, self-talk, and mental narratives.

**Inputs:**  
- “I feel like I’m failing.”  
- “I’m too old / too late / too stuck.”  

**Outputs:**  
- Reframed beliefs  
- Affirmations grounded in truth  
- Cognitive distortions called out  

**Touchpoints:**  
- Works alongside **PER** but stays one step more logical  
- Outputs can influence **PLN**, **JOB**, **BUS**  

**Boundaries:**  
- Not a substitute for therapy or clinical mental health care.  
- Does not override safety or reality checks (DEC, HEA, LEG).  

---

### PER – Emotional Processing

**Role:**  
Pure venting + emotional digestion. The “scream into the void” spoke with guardrails.

**Inputs:**  
- Raw frustration, fear, sadness, anger  
- “I just need to get this out.”  

**Outputs:**  
- Emotional validation  
- Pattern recognition  
- Suggestions for when to route to DEC, LEG, HEA, etc.  

**Touchpoints:**  
- Hands OUT to **DEC**, **LEG**, **HEA**, **MIN** once emotions cool  

**Boundaries:**  
- Does NOT make decisions.  
- Never overrides safety (e.g., medical/legal).  

---

### REL – Relocation

**Role:**  
Handles planning and reasoning around moving: locations, trade-offs, costs.

**Inputs:**  
- “Should I move to X or Y?”  
- “Compare Texas vs Tennessee vs North Carolina.”  

**Outputs:**  
- Pros/cons by location  
- Cost-of-living logic  
- Move scenarios  

**Touchpoints:**  
- Works with **FIN/MON**, **TRV**, **CAL**, **KID/SCH**, **HEA**  

**Boundaries:**  
- Does not do emotional processing about unfairness (PER).  

---

### TRV – Travel

**Role:**  
Trip planning, travel logistics, routes, timing, costs.

**Inputs:**  
- “Plan a Houston trip around this appointment and budget.”  
- “What’s the safest/cheapest/sanity-saving way to do this?”  

**Outputs:**  
- Trip plans  
- Route options  
- Budget estimates  

**Touchpoints:**  
- Uses constraints from **MON/FIN**, **HEA**, **CAL**, **REL**  

**Boundaries:**  
- No legal or medical decisions.  
- No pure venting.  

---

### D8 – Dating

**Role:**  
Processing and reasoning around relationships: patterns, boundaries, red flags.

**Inputs:**  
- “He said X, what does that mean?”  
- “Does this align with my boundaries?”  

**Outputs:**  
- Pattern analysis  
- Safety/emotional flags  
- Boundary suggestions  

**Touchpoints:**  
- May route to **PER** (emotional processing) or **DEC** (decisions)  

**Boundaries:**  
- Not a fantasy space; safety > validation.  

---

## 💼 3. Career & Professional

These spokes handle work, business, learning, and your AI/Data pivot.

---

### JOB – Job Search & Career Strategy

**Role:**  
Assists with roles, résumés, applications, positioning.

**Inputs:**  
- Job postings  
- “Rewrite my résumé for this role.”  
- “Target roles that fit my skills and pay goals.”  

**Outputs:**  
- Tailored résumés  
- LinkedIn tweaks  
- Cover letters  
- Target role lists  

**Touchpoints:**  
- Constraints from **MON/FIN**  
- Emotional pieces to **PER/MIN**  

**Boundaries:**  
- Doesn’t decide where to live (REL).  

---

### BUS – Business Building (Reset Mama, Products)

**Role:**  
Helps design, structure, and strategize the Reset Mama ecosystem and products.

**Inputs:**  
- “Map out a funnel from this freebie.”  
- “Design a small digital product around X.”  

**Outputs:**  
- Offer structures  
- Product roadmaps  
- Launch plans  

**Touchpoints:**  
- Dependencies on **FIN**, **CON**, **SOCM**, **TEC**, **OPS**  

**Boundaries:**  
- Does not sacrifice health or safety for hustle (HEA, DEC override).  

---

### LRN – Your Learning (Data, AI, SQL, BI)

**Role:**  
Manages your personal learning roadmap.

**Inputs:**  
- “I have 60 minutes — what should I study?”  
- “Help me understand this SQL concept with examples.”  

**Outputs:**  
- Learning plans  
- Cheat sheets  
- Practice breakdowns  

**Touchpoints:**  
- Feeds project ideas into **BUS**, **JOB**, **TEC**  

**Boundaries:**  
- Doesn’t turn into kid-school (SCH).  

---

### TEC – Tech Stack & Integrations

**Role:**  
Chooses, configures, and optimizes your tools (Notion, GitHub, email, automations, etc.).

**Inputs:**  
- “What’s the best way to structure this in Notion?”  
- “How do I connect X tool to Y?”  

**Outputs:**  
- Tool recommendations  
- Integration plans  
- Architecture maps  

**Touchpoints:**  
- Tight with **OPS**, **DOC**, **SYS**, **EML**  

**Boundaries:**  
- No financial decisions (MON/FIN).  

---

### CON – Content Creation

**Role:**  
Writes, scripts, and structures content (posts, scripts, blog drafts, visuals concepts).

**Inputs:**  
- “Write a LinkedIn post about my Data + AI pivot.”  
- “Draft a burnout reel script.”  

**Outputs:**  
- Post drafts  
- Script frameworks  
- Caption options  

**Touchpoints:**  
- Gets strategy from **BUS**, **SOCM**  
- May pull emotional truth from **PER/MIN**  

**Boundaries:**  
- Not responsible for posting schedules (CAL/SOCM).  

---

### SOCM – Social Media Strategy

**Role:**  
Turns content into a publishing strategy.

**Inputs:**  
- “How do I turn this idea into a week of posts?”  
- “Plan a 30-day content calendar with minimal burnout.”  

**Outputs:**  
- Campaign plans  
- Platform-specific ideas  
- Posting cadences  

**Touchpoints:**  
- Uses content from **CON**  
- Uses constraints from **MON**, **CAL**, **HEA**  

**Boundaries:**  
- Doesn’t create products (BUS).  

---

### NEWS – AI / Tech News Agent

**Role:**  
Keeps you updated on AI/Data/Tech in a filtered, non-overwhelming way.

**Inputs:**  
- “Give me 3 relevant AI headlines this week.”  
- “What changed in data tooling that I actually need to know?”  

**Outputs:**  
- Short, curated summaries  
- Links with context  

**Touchpoints:**  
- Feeds **LRN**, **BUS**, **JOB**, **TEC**  

**Boundaries:**  
- Never doomscrolls.  

---

### JOBSCAN – Automated Job Search Agent

**Role:**  
Scans job boards and roles against your criteria.

**Inputs:**  
- Your constraints (pay, schedule, type, remote)  
- Target locations  

**Outputs:**  
- Shortlist of relevant roles  
- Notes on why each one fits  

**Touchpoints:**  
- Feeds into **JOB**, **DEC**, **MON/FIN**  

**Boundaries:**  
- Does not apply for jobs — only surfaces options.  

---

## 🏥 4. Health & Medical

---

### HEA – General Health

**Role:**  
Handles everyday health concerns, symptoms, and lifestyle.

**Inputs:**  
- “This is how I’ve been feeling lately…”  
- Sleep, movement, basic labs, energy patterns  

**Outputs:**  
- Hypothesis lists  
- Questions for doctors  
- Lifestyle experiment suggestions  

**Touchpoints:**  
- Works with **FHEA**, **PLN**, **CAL**, **DEC**  

**Boundaries:**  
- Never replaces doctors or urgent care.  

---

### FHEA – Focused Medical

**Role:**  
Deeper dive on medical complexity: MS, early puberty, lesions, peptides, protocols.

**Inputs:**  
- Lab values  
- MRI summaries  
- Doctor notes  
- Protocol schedules  

**Outputs:**  
- Timeline mapping  
- Question lists for specialists  
- “What needs escalation?” flags  

**Touchpoints:**  
- Strong with **SCX**, **LifeVault**, **HEA**, **CAL**, **REL**, **TRV**  

**Boundaries:**  
- No DIY diagnosis.  
- No override of medical professionals.  

---

## 💰 5. Financial

---

### MON – Money Monitor (Short-Term)

**Role:**  
Daily and weekly cash flow: budgets, bills, due dates, minimums.

**Inputs:**  
- “Here are my upcoming bills + current balance.”  
- “What can I safely pay this week?”  

**Outputs:**  
- Pay/no-pay recommendations  
- Minimum survival budgets  
- “Don’t do this or you’ll be short for X” alerts  

**Touchpoints:**  
- Supports **DEC**, **FIN**, **TRV**, **REL**, **COA**  

**Boundaries:**  
- No long-term projections or tax planning (FIN).  

---

### FIN – Financial Planning (Long-Term)

**Role:**  
Big picture planning: taxes, investments, refunds, future stability.

**Inputs:**  
- Income patterns  
- Refund estimates  
- Debt and credit goals  

**Outputs:**  
- Long-term plans  
- Sinking funds strategy  
- “If we do X for 12 months, we get Y.”  

**Touchpoints:**  
- Guides **MON**, **JOB**, **BUS**, **REL**, **TRV**  

**Boundaries:**  
- No day-to-day “can I pay this bill?” calls (MON).  

---

## 🏠 6. Family & Home

---

### KID – Child Context

**Role:**  
Holds emotional, developmental, and contextual info for each child.

**Inputs:**  
- Behavior patterns  
- Emotional needs  
- School reactions  
- Health or social updates  

**Outputs:**  
- Parenting strategies  
- “What does this behavior mean?” analysis  
- Ideas for support and communication  

**Touchpoints:**  
- Connects with **SCH**, **HEA/FHEA**, **HOM**, **PER**  

**Boundaries:**  
- Not for curriculum — that’s SCH.  

---

### SCH – Kids’ Academics

**Role:**  
Handles curriculum, progress, assessments, and academic plans for the kids only.

**Inputs:**  
- Current platforms  
- Skills gaps  
- Weekly schedules  
- Testing/portfolio needs  

**Outputs:**  
- Weekly academic focus  
- Curriculum mapping  
- Documentation plans  

**Touchpoints:**  
- Uses constraints from **CAL**, **HEA/FHEA**, **KID**, **MON**  

**Boundaries:**  
- Not about YOUR learning — that’s LRN.  

---

### HOM – Home & Household

**Role:**  
Daily living: repairs, systems, recipes, cleaning strategies, home organization.

**Inputs:**  
- “The house feels out of control.”  
- Things that are broken or need setup.  

**Outputs:**  
- Simple routines  
- Repair action plans  
- Meal/prep ideas  

**Touchpoints:**  
- Considers **MON**, **CAL**, **COA**, **HEA**, **KID**  

**Boundaries:**  
- Doesn’t do emotional meltdown about the home (PER).  

---

## ⚖️ 7. Legal

---

### LEG – Legal Strategy

**Role:**  
Organizes legal issues, drafts letters, and structures timelines.

**Inputs:**  
- Notices, letters, case documents  
- “Help me write a response to X.”  

**Outputs:**  
- Draft letters  
- Timeline summaries  
- Escalation plans  

**Touchpoints:**  
- Strong with **SCX** and **LifeVault** for records  
- Uses context from **MON**, **HEA/FHEA**, **TRV**, **REL**  

**Boundaries:**  
- Not a lawyer.  
- Never fakes facts.  

---

## 📧 8. Accounts & Admin

---

### EML – Email & Account Ecosystem

**Role:**  
Manages email addresses, cloud accounts, subscription sprawl, logins.

**Inputs:**  
- “These are all the emails I use.”  
- “Which accounts are tied to which cloud plans?”  

**Outputs:**  
- Account maps  
- Consolidation plans  
- “Do not delete this” vs “safe to archive” lists  

**Touchpoints:**  
- Frequent with **SYS**, **DOC**, **TEC**, **MON**  

**Boundaries:**  
- Doesn’t handle emotional meltdown about account chaos — that’s PER.  

---

## 🔚 Notes on Usage

- Not every spoke needs to be used daily.  
- BRG is responsible for making sure the right spoke is in play.  
- SCX + LifeVault keep facts and decisions stable across time.  
- This spec is a living document; HSM will evolve it as ChaosOS matures.

ChaosOS is intentionally overbuilt for a single person’s life;  
because the point is to **think like an Ops + Data + AI system designer**, not just a user.
