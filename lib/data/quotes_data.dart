import '../models/quote.dart';

/// Master list of curated quotes across all categories.
const List<Quote> kAllQuotes = [
  // ── MOTIVATION ─────────────────────────────────────────────────────────────
  Quote(
    id: 'm1',
    text: "The only way to do great work is to love what you do.",
    author: "Steve Jobs",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm2',
    text: "Push yourself, because no one else is going to do it for you.",
    author: "Unknown",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm3',
    text: "It does not matter how slowly you go as long as you do not stop.",
    author: "Confucius",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm4',
    text: "Don't watch the clock; do what it does. Keep going.",
    author: "Sam Levenson",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm5',
    text: "Act as if what you do makes a difference. It does.",
    author: "William James",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm6',
    text:
        "Success is not final, failure is not fatal: It is the courage to continue that counts.",
    author: "Winston Churchill",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm7',
    text: "Believe you can and you're halfway there.",
    author: "Theodore Roosevelt",
    category: QuoteCategory.motivation,
  ),
  Quote(
    id: 'm8',
    text:
        "You are never too old to set another goal or to dream a new dream.",
    author: "C.S. Lewis",
    category: QuoteCategory.motivation,
  ),

  // ── WISDOM ──────────────────────────────────────────────────────────────────
  Quote(
    id: 'w1',
    text: "The journey of a thousand miles begins with one step.",
    author: "Lao Tzu",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w2',
    text:
        "In the middle of every difficulty lies opportunity.",
    author: "Albert Einstein",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w3',
    text: "Life is what we make it, always has been, always will be.",
    author: "Grandma Moses",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w4',
    text:
        "Knowing yourself is the beginning of all wisdom.",
    author: "Aristotle",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w5',
    text:
        "The more that you read, the more things you will know. The more that you learn, the more places you'll go.",
    author: "Dr. Seuss",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w6',
    text: "Turn your wounds into wisdom.",
    author: "Oprah Winfrey",
    category: QuoteCategory.wisdom,
  ),
  Quote(
    id: 'w7',
    text: "Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself.",
    author: "Rumi",
    category: QuoteCategory.wisdom,
  ),

  // ── LIFE ────────────────────────────────────────────────────────────────────
  Quote(
    id: 'l1',
    text:
        "Life is 10% what happens to us and 90% how we react to it.",
    author: "Charles R. Swindoll",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l2',
    text: "In the end, it's not the years in your life that count. It's the life in your years.",
    author: "Abraham Lincoln",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l3',
    text: "Life itself is the most wonderful fairy tale.",
    author: "Hans Christian Andersen",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l4',
    text:
        "The purpose of our lives is to be happy.",
    author: "Dalai Lama",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l5',
    text: "You only live once, but if you do it right, once is enough.",
    author: "Mae West",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l6',
    text: "Be the change you wish to see in the world.",
    author: "Mahatma Gandhi",
    category: QuoteCategory.life,
  ),
  Quote(
    id: 'l7',
    text: "Life is short, and it is up to you to make it sweet.",
    author: "Sarah Louise Delany",
    category: QuoteCategory.life,
  ),

  // ── LOVE ────────────────────────────────────────────────────────────────────
  Quote(
    id: 'lo1',
    text: "The best thing to hold onto in life is each other.",
    author: "Audrey Hepburn",
    category: QuoteCategory.love,
  ),
  Quote(
    id: 'lo2',
    text: "Love is not about how many days, months, or years you have been together. It's about how much you love each other every single day.",
    author: "Unknown",
    category: QuoteCategory.love,
  ),
  Quote(
    id: 'lo3',
    text: "The greatest happiness of life is the conviction that we are loved.",
    author: "Victor Hugo",
    category: QuoteCategory.love,
  ),
  Quote(
    id: 'lo4',
    text: "Love is composed of a single soul inhabiting two bodies.",
    author: "Aristotle",
    category: QuoteCategory.love,
  ),
  Quote(
    id: 'lo5',
    text: "Where there is love there is life.",
    author: "Mahatma Gandhi",
    category: QuoteCategory.love,
  ),

  // ── HUMOR ───────────────────────────────────────────────────────────────────
  Quote(
    id: 'h1',
    text: "I'm not lazy. I'm on energy-saving mode.",
    author: "Unknown",
    category: QuoteCategory.humor,
  ),
  Quote(
    id: 'h2',
    text: "I told myself I should stop drinking. But I'm not about to listen to a drunk who talks to himself.",
    author: "Unknown",
    category: QuoteCategory.humor,
  ),
  Quote(
    id: 'h3',
    text: "Age is of no importance unless you're a cheese.",
    author: "Billie Burke",
    category: QuoteCategory.humor,
  ),
  Quote(
    id: 'h4',
    text: "Light travels faster than sound. This is why some people appear bright until you hear them speak.",
    author: "Alan Dundes",
    category: QuoteCategory.humor,
  ),
  Quote(
    id: 'h5',
    text: "Behind every great man is a woman rolling her eyes.",
    author: "Jim Carrey",
    category: QuoteCategory.humor,
  ),
  Quote(
    id: 'h6',
    text: "Common sense is like deodorant. The people who need it most never use it.",
    author: "Unknown",
    category: QuoteCategory.humor,
  ),

  // ── SUCCESS ─────────────────────────────────────────────────────────────────
  Quote(
    id: 's1',
    text: "Success usually comes to those who are too busy to be looking for it.",
    author: "Henry David Thoreau",
    category: QuoteCategory.success,
  ),
  Quote(
    id: 's2',
    text: "The secret of success is to do the common thing uncommonly well.",
    author: "John D. Rockefeller Jr.",
    category: QuoteCategory.success,
  ),
  Quote(
    id: 's3',
    text: "I never dreamed about success. I worked for it.",
    author: "Estée Lauder",
    category: QuoteCategory.success,
  ),
  Quote(
    id: 's4',
    text: "Don't be afraid to give up the good to go for the great.",
    author: "John D. Rockefeller",
    category: QuoteCategory.success,
  ),
  Quote(
    id: 's5',
    text: "Success is walking from failure to failure with no loss of enthusiasm.",
    author: "Winston Churchill",
    category: QuoteCategory.success,
  ),
  Quote(
    id: 's6',
    text: "The road to success and the road to failure are almost exactly the same.",
    author: "Colin R. Davis",
    category: QuoteCategory.success,
  ),

  // ── COURAGE ─────────────────────────────────────────────────────────────────
  Quote(
    id: 'c1',
    text: "Courage is not the absence of fear, but rather the judgment that something else is more important than fear.",
    author: "Ambrose Redmoon",
    category: QuoteCategory.courage,
  ),
  Quote(
    id: 'c2',
    text: "You gain strength, courage, and confidence by every experience in which you really stop to look fear in the face.",
    author: "Eleanor Roosevelt",
    category: QuoteCategory.courage,
  ),
  Quote(
    id: 'c3',
    text: "It takes courage to grow up and become who you really are.",
    author: "E.E. Cummings",
    category: QuoteCategory.courage,
  ),
  Quote(
    id: 'c4',
    text: "One man with courage makes a majority.",
    author: "Andrew Jackson",
    category: QuoteCategory.courage,
  ),
  Quote(
    id: 'c5',
    text: "Courage is grace under pressure.",
    author: "Ernest Hemingway",
    category: QuoteCategory.courage,
  ),

  // ── MINDFULNESS ─────────────────────────────────────────────────────────────
  Quote(
    id: 'mn1',
    text: "The present moment is the only moment available to us, and it is the door to all moments.",
    author: "Thich Nhat Hanh",
    category: QuoteCategory.mindfulness,
  ),
  Quote(
    id: 'mn2',
    text: "Peace comes from within. Do not seek it without.",
    author: "Buddha",
    category: QuoteCategory.mindfulness,
  ),
  Quote(
    id: 'mn3',
    text: "Almost everything will work again if you unplug it for a few minutes, including you.",
    author: "Anne Lamott",
    category: QuoteCategory.mindfulness,
  ),
  Quote(
    id: 'mn4',
    text: "Nothing is worth more than this day.",
    author: "Johann Wolfgang von Goethe",
    category: QuoteCategory.mindfulness,
  ),
  Quote(
    id: 'mn5',
    text: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
    author: "Buddha",
    category: QuoteCategory.mindfulness,
  ),
  Quote(
    id: 'mn6',
    text: "In today's rush, we all think too much, seek too much, want too much, and forget about the joy of just being.",
    author: "Eckhart Tolle",
    category: QuoteCategory.mindfulness,
  ),
];
